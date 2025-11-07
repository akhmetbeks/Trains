//
//  FIlterView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedFilters: Set<Filter> = []
    @State private var showStops = false
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack(alignment: .leading) {
            FilterTimeView(selectedFilters: $selectedFilters)
            
            FilterStopsView(showStops: $showStops)
            
            Spacer()
            
            CustomButton(title: "Применить") {
                router.pop()
            }
        }
        .padding(16)
        .background(.appWhite)
    }
}

#Preview {
    FilterView()
        .environmentObject(Router())
}
