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
}

//MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
