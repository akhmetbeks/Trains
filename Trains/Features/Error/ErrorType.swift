//
//  ErrorType.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 11.11.2025.
//

import SwiftUI

enum ErrorType {
    case noInternet
    case serverError
    
    var title: String {
        switch self {
        case .noInternet:
            return "Нет интернета"
        case .serverError:
            return "Ошибка сервера"
        }
    }
    
    var image: ImageResource {
        switch self {
        case .noInternet:
                .noInternet
        case .serverError:
                .serverError
        }
    }
}
