//
//  ScheduleService.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 22.10.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias Stations = Components.Schemas.AllStationsResponse

protocol StationsListServiceProtocol {
    func getAllStations() async throws -> Stations
}

final class StationsListService: StationsListServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getAllStations() async throws -> Stations {
        let response = try await client.getAllStations(query: .init(apikey: apikey))
        
        return try response.ok.body.json
    }
}
