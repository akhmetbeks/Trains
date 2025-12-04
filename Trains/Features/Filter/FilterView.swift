//
//  FIlterView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//

import SwiftUI

struct FilterView: View {
    @State private var viewModel = FilterViewModel()
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack(alignment: .leading) {
            FilterTimeView(selectedFilters: $viewModel.selectedFilters)
            
            FilterStopsView(stopOption: $viewModel.stopOption)
            
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
