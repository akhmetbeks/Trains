//
//  Segment+Extension.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//
import Foundation

extension Segment {
    func startDateToString(formatter: DateFormatter) -> String {
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self.start_date ?? "") else { return "" }
        
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: date)
    }
}
