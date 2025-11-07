//
//  ScheduleService.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 22.10.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias CarrierResponse = Components.Schemas.CarrierResponse
typealias Carrier = Components.Schemas.Carrier

protocol CarrierServiceProtocol {
    func getCarrierInfo(of code: String) async throws -> CarrierResponse
}

final class CarrierService: CarrierServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarrierInfo(of code: String) async throws -> CarrierResponse {
        let response = try await client.getCarrierInfo(query: .init(apikey: apikey, code: code))

        return try response.ok.body.json
    }
}
