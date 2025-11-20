//
//  Filter.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//

enum Filter {
    enum Time: String, CaseIterable, Identifiable {
        var id: Self { self }
        case morning = "Утро 06:00 - 12:00"
        case day = "День 12:00 - 18:00"
        case evening = "Вечер 18:00 - 00:00"
        case night = "Ночь 00:00 - 06:00"
    }
    
    enum Stop: String, CaseIterable, Identifiable {
        var id: Self { self }
        case yes = "Да"
        case no = "Нет"
    }
}
