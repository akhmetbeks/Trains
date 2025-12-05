//
//  HomeViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 05.11.2025.
//

import Observation

@MainActor
@Observable
final class HomeViewModel {
    var fromCity: NodeModel?
    var fromStation: NodeModel?
    var toCity: NodeModel?
    var toStation: NodeModel?
    
    var fromDisplay: String? {
        if fromCity == nil && fromStation == nil {
            return nil
        } else if fromStation == nil {
            return fromCity?.title
        } else {
            return "\(fromCity?.title ?? "") (\(fromStation?.title ?? ""))"
        }
    }
    
    var toDisplay: String? {
        if toCity == nil && toStation == nil {
            return nil
        } else if toStation == nil {
            return toCity?.title
        } else {
            return "\(toCity?.title ?? "") (\(toStation?.title ?? ""))"
        }
    }
    
    var findEnabled: Bool {
        fromCity != nil && fromStation != nil && toCity != nil && toStation != nil
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
