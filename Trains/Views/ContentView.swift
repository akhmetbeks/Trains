//
//  ContentView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 20.10.2025.
//

import SwiftUI
import OpenAPIURLSession
import OpenAPIRuntime

let apiKey = "edab6524-aec5-4536-8f2b-b730c80b4da5"

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            
        }
    }
}

#Preview {
    ContentView()
}

func testNearestStations() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            
            let service = NearestStationsService(client: client, apikey: apiKey)
            
            let response = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            
            print(response.stations?.compactMap({ $0.code }) as Any)
        } catch {
            print(error.localizedDescription)
        }
    }
}

func testScheduleBetweenStations() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            
            let service = ScheduleService(client: client, apikey: apiKey)
            
            let response = try await service.getSchedule(of: "")
            
            print(response.?.compactMap({ $0.code }) as Any)
        } catch {
            print(error.localizedDescription)
        }
    }
}
