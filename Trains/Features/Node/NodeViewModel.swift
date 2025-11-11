//
//  NodeViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 11.11.2025.
//

import Observation
import Foundation

enum NodeListState {
    case loading
    case empty
    case data([String])
}

@Observable
final class NodeViewModel {
    var isCity: Bool

    var searchText: String = ""
    var state: NodeListState {
        let items = isCity ? cities : stations
        guard !searchText.isEmpty else {
            return .data(items)
        }
        
        let filtered = items.filter({
            $0.localizedCaseInsensitiveContains(searchText)
        })
        
        return filtered.isEmpty ? .empty : .data(filtered)
    }
    
    init(isCity: Bool) {
        self.isCity = isCity
    }
    
    let stations = ["Алматы-1", "Алматы-2", "Астана", "Шымкент",
                  "Караганда", "Павлодар", "Костанай", "Актобе",
                  "Тараз", "Уральск", "Кокшетау", "Петропавловск",
                  "Семей", "Өскемен", "Кызылорда", "Актау",
                  "Атырау", "Жезказган", "Балхаш", "Туркестан",
                  "Экибастуз", "Темиртау", "Рудный", "Щучинск",
                  "Сарыагаш", "Кульсары"]
    
    let cities = [ "Алматы", "Астана", "Шымкент",
                  "Караганда", "Павлодар", "Костанай", "Актобе",
                  "Тараз", "Уральск", "Кокшетау", "Петропавловск",
                  "Семей", "Өскемен", "Кызылорда", "Актау",
                  "Атырау", "Жезказган", "Балхаш", "Туркестан",
                  "Экибастуз", "Темиртау", "Рудный", "Щучинск",
                  "Сарыагаш", "Кульсары"]
    
    func filter(_ text: String) {
        
    }
    
}
