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
    @Published var selectedLocationCoordinate : CLLocationCoordinate2D?
    
    private let searchCompletor = MKLocalSearchCompleter()
    var queryFragment : String = "" {
        didSet {
            searchCompletor.queryFragment = queryFragment
        }
    }
    
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
            self.selectedLocationCoordinate = coordinate
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
}

//MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
