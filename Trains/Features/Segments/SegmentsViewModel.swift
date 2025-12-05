//
//  ScheduleViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//
import Observation
import OpenAPIURLSession
import Foundation

@MainActor
@Observable
final class SegmentsViewModel {
    var segments: [Segment] = []
    
    func fetchSchedule(from: String, to: String) async throws {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = SearchService(client: client, apikey: Constants.apikey)
                let response = try await service.getSchedualBetweenStations(from: from, to: to)
                segments = response.segments ?? []
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
