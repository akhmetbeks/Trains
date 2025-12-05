//
//  NodeViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 11.11.2025.
//

import Observation
import Foundation
import OpenAPIURLSession
import OpenAPIRuntime

enum NodeListState {
    case loading
    case empty
    case data
}

@MainActor
@Observable
final class NodeViewModel {
    private let service: StationsListService
    var stations: [Station]?
    var regions: [Region]?
    var selectedRegion: String?
    var searchText: String = ""
    
    var state: NodeListState = .empty
    
    init(isCity: Bool, selectedRegion: String?) {
        self.selectedRegion = selectedRegion
        
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        self.service = StationsListService(client: client, apikey: Constants.apikey)
    }
    
    var items: [NodeModel] {
        let base: [NodeModel] = {
            if selectedRegion == nil {
                return regions?.compactMap(\.asNodeItem) ?? []
            } else {
                return stations?.compactMap(\.asNodeItem) ?? []
            }
        }()

        guard !searchText.isEmpty else { return base }

        return base.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    func loadStationsList() async throws {
        do {
            state = .loading
            let response = try await service.getAllStations()
            let country = response.countries?.first(where: { $0.title == "Россия" })
            
            if selectedRegion != nil {
                stations = country?.regions?.first(where: { $0.title == selectedRegion ?? ""})?.settlements.flatMap({ settlement in
                    settlement.first?.stations
                })
                state = stations?.isEmpty == true ? .empty : .data
            } else {
                regions = country?.regions
                state = regions?.isEmpty == true ? .empty : .data
            }
        } catch {
            print("Error while fetching stations: \(error.localizedDescription)")
        }
    }
}
