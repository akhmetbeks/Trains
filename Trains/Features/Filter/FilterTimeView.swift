//
//  FilterTimeView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 07.11.2025.
//

import SwiftUI

struct FilterTimeView: View {
    @Binding var selectedFilters: Set<Filter.Time>
    
    var body: some View {
        Text("Время отправления")
            .font(.system(size: 24, weight: .bold))
            .padding(.vertical, 16)
        
        VStack {
            ForEach(Filter.Time.allCases) { filter in
                Toggle(isOn: Binding(
                    get: { selectedFilters.contains(filter) },
                    set: { value in
                        if selectedFilters.contains(filter) {
                            selectedFilters.remove(filter)
                        } else {
                            selectedFilters.insert(filter)
                        }
                    })
                ) {
                    Text(filter.rawValue)
                }
                .padding(.vertical, 15)
                .toggleStyle(CustomCheckbox())
            }
        }
        .frame(height: 200)
    }
}
