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
    var searchText: String = ""
    var state: NodeListState = .empty
    
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
    
    func filter(_ text: String, isCity: Bool) {
        let items = isCity ? cities : stations
        guard !text.isEmpty else {
            state = .data(items)
            return
        }
        
        let filtered = items.filter({
            $0.localizedCaseInsensitiveContains(text)
        })
        
        state = filtered.isEmpty ? .empty : .data(filtered)
    }
    
}
