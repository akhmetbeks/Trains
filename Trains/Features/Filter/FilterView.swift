//
//  FIlterView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedFilters: Set<Filter.Time> = []
    @State private var stopOption: Filter.Stop = .no
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack(alignment: .leading) {
            FilterTimeView(selectedFilters: $selectedFilters)
            
            FilterStopsView(stopOption: $stopOption)
            
            Spacer()
            
            CustomButton(title: "Применить", maxWidth: .infinity) {
                router.pop()
            }
        }
        .padding(16)
        .background(.appWhite)
        .customBackButton()
    }
}

#Preview {
    FilterView()
        .environmentObject(Router())
}
