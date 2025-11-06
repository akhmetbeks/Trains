//
//  ContentView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 20.10.2025.
//

import SwiftUI
import OpenAPIURLSession
import OpenAPIRuntime

let apikey = "edab6524-aec5-4536-8f2b-b730c80b4da5"
struct ContentView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        TabBarView()
            .environmentObject(router)
    }
}

#Preview {
    ContentView()
}

func callService(completion: @escaping (Client) async throws -> Void) {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            
            try await completion(client)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Nearest Stations Service
private func testNearestStations(client: Client) async throws {
    let service = NearestStationsService(client: client, apikey: apikey)
    
    let response = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
    
    print(response.stations?.compactMap({ $0.code }) as Any)
}

// MARK: - Stations List Service
private func testAllStations(client: Client) async throws {
    let service = StationsListService(client: client, apikey: apikey)
    
    let response = try await service.getAllStations()
    
    print(response.countries?.compactMap(\.codes?.yandex_code) as Any)
}

// MARK: - Copyright Service
private func testCopyright(client: Client) async throws {
    let service = CopyrightService(client: client, apikey: apikey)
    
    let response = try await service.getCopyright()
    
    print(response.copyright as Any)
}

// MARK: - Nearest Settlement Service
private func testNearestSettlement(client: Client) async throws {
    let service = NearestSettlementService(client: client, apikey: apikey)
    
    let response = try await service.getNearestCity(lat: 43.2619, lng: 76.9295)
    
    print(response as Any)
}

// MARK: - Carrier Service
private func testCarrier(client: Client) async throws {
    let service = CarrierService(client: client, apikey: apikey)
    
    let response = try await service.getCarrierInfo(of: "680")
    
    print(response as Any)
}

// MARK: - Schedule Service
private func testSchedule(client: Client) async throws {
    let service = ScheduleService(client: client, apikey: apikey)
    
    let response = try await service.getSchedule(of: "s9600213")
    
    print(response.schedule?.compactMap(\.terminal) as Any)
}

// MARK: - Search Service
private func testSearch(client: Client) async throws {
    let service = SearchService(client: client, apikey: apikey)
    
    let response = try await service.getSchedualBetweenStations(from: "c146", to: "c213")
    
    print(response.interval_segments as Any)
    print(response.segments as Any)
}

// MARK: - Thread Service
private func testThread(client: Client) async throws {
    let service = ThreadStationsService(client: client, apikey: apikey)
    
    let response = try await service.getRouteStations(of: "098S_3_2")
    
    print(response as Any)
}
