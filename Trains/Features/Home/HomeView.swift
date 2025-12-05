//
//  Main.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 03.11.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router: Router
    @Environment(HomeViewModel.self) private var vm
    
    var body: some View {
        VStack {
            StoriesStackView()
                .padding(.top, 24)
                .padding(.bottom, 44)
            
            SearchView()
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .environment(vm)
            
            if vm.findEnabled {
                CustomButton(title: "Найти", innerPadding: 47.5) {
                    router.push(.search)
                }
            }
            
            Spacer()
        }
        .background(.appWhite)
    }
}

#Preview {
    HomeView()
        .environmentObject(Router())
        .environment(HomeViewModel())
}

