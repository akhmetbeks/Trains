//
//  DestinationEnum.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 05.11.2025.
//

import Observation
import Combine

final class Router: ObservableObject {
    @Published var path: [Route] = []
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        _ = path.popLast()
    }
    
    func popToRoot() {
        path = []
    }
}

enum Route: Hashable {
    enum Node {
        case fromCity
        case fromStation
        case toCity
        case toStation
    }
    
    case node(_ type: Node, region: String?)
    case search
    case filter
    case carrier(_ carrier: Carrier)
    case agreement
}

extension Route.Node {
    var title: String {
        switch self {
        case .fromCity, .toCity:
            return "Выбор города"
        case .fromStation, .toStation:
            return "Выбор станции"
        }
    }
    
    var noResult: String {
        switch self {
        case .fromCity, .toCity:
            return "Город не найден"
        case .fromStation, .toStation:
            return "Станция не найдена"
        }
    }
    
    var isCity: Bool {
        self == .fromCity || self == .toCity
    }
}
