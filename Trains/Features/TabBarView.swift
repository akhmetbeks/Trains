//
//  TabBarView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 03.11.2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("", image: .schedule)
                }
            Text("Settings")
                .tabItem {
                    Label("", image: .settings)
                }
        }
        .background(.appWhite)
    }
}

#Preview {
    TabBarView()
}
