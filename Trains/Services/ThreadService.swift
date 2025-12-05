//
//  ScheduleService.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 22.10.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Thread = Components.Schemas.ThreadStationsResponse

protocol ThreadStationsServiceProtocol {
    func getRouteStations(of uid: String) async throws -> Thread
}

actor ThreadStationsService: ThreadStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getRouteStations(of uid: String) async throws -> Thread {
        let response = try await client.getRouteStations(query: .init(
            apikey: apikey,
            uid: uid
        ))
        
        return try await response.ok.body.json
    }
}
