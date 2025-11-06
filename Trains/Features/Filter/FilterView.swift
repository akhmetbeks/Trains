//
//  FIlterView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedFilters: Set<Filter> = []
    
    var body: some View {
        VStack {
            Text("Время отправки")
                .font(.system(size: 24, weight: .bold))
                .padding(.vertical, 16)
            
            List {
                ForEach(Filter.allCases) { filter in
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
                }
            }
        }
        .foregroundStyle(.appBlack)
        .padding(16)
    }
}

#Preview {
    FilterView()
}
