//
//  ScheduleService.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 22.10.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Schedules = Components.Schemas.ScheduleResponse

protocol ScheduleServiceProtocol {
    func getSchedule(of station: String) async throws -> Schedules
}

final class ScheduleService: ScheduleServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getSchedule(of station: String) async throws -> Schedules {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apikey,
            station: station
        ))
        
        return try response.ok.body.json
    }
}
