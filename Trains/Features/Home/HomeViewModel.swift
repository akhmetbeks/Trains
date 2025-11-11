//
//  HomeViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 05.11.2025.
//

import Observation
@Observable
final class HomeViewModel {
    var fromCity: String = ""
    var fromStation: String = ""
    var toCity: String = ""
    var toStation: String = ""
    
    var fromDisplay: String? {
        if fromCity.isEmpty && fromStation.isEmpty {
            return nil
        } else if fromStation.isEmpty {
            return fromCity
        } else {
            return "\(fromCity) (\(fromStation))"
        }
    }
    
    var toDisplay: String? {
        if toCity.isEmpty && toStation.isEmpty {
            return nil
        } else if toStation.isEmpty {
            return toCity
        } else {
            return "\(toCity) (\(toStation))"
        }
    }
    
    var findEnabled: Bool {
        !fromCity.isEmpty && !fromStation.isEmpty && !toCity.isEmpty && !toStation.isEmpty
    }
    
    func swap() {
        let tempCity = fromCity
        let tempStation = fromStation
        fromCity = toCity
        fromStation = toStation
        toCity = tempCity
        toStation = tempStation
    }
}
