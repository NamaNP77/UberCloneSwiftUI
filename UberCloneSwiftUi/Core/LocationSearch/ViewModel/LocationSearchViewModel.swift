//
//  LocationSearchViewModel.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 27/01/24.
//

import Foundation
import MapKit

class LocationSearchViewModel : NSObject, ObservableObject {
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedUberLocation : UberLocation?
    @Published var pickUpTime : String?
    @Published var dropOffTime : String?
    
    private let searchCompletor = MKLocalSearchCompleter()
    var queryFragment : String = "" {
        didSet {
            searchCompletor.queryFragment = queryFragment
        }
    }
    
    var userLocation : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        searchCompletor.delegate = self
        searchCompletor.queryFragment = queryFragment
    }
    
    func selectedLocation(_ localSearch : MKLocalSearchCompletion){
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("Local Search failed with error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else {return}
            let coordinate = item.placemark.coordinate
            self.selectedUberLocation = UberLocation(title: localSearch.title, coordinate: coordinate)
            print("Location Coordinates : \(coordinate)")
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch : MKLocalSearchCompletion,
                        completion : @escaping MKLocalSearch.CompletionHandler){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(forType type : RideType) -> Double{
        guard let destCoordinate = selectedUberLocation?.coordinate else {return 0.0}
        guard let userCoordinate = self.userLocation else {return 0.0}
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: destCoordinate.latitude, longitude: destCoordinate.longitude)
        
        let tripDistanceInMeter = userLocation.distance(from: destination)
        return type.computePrice(for: tripDistanceInMeter)
    }
    
    func getDestinationRoute(from userLocation : CLLocationCoordinate2D,
                             to destination : CLLocationCoordinate2D ,
                             completion : @escaping(MKRoute) -> () ){
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let error = error {
                print("Failed with error \(error.localizedDescription)")
                return
            }
            guard let route = response?.routes.first else {return}
            self.configurePickupAndDropoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickupAndDropoffTimes(with expectedTravelTime : Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickUpTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
}

//MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
