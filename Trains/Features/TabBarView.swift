//
//  TabBarView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 03.11.2025.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var router: Router
    @State private var vm = HomeViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                HomeView()
                    .tabItem {
                        Label("", image: .schedule)
                    }
                    .environment(vm)
                Text("Settings")
                    .tabItem {
                        Label("", image: .settings)
                    }
            }
            .background(.appWhite)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .node(let type):
                    NodeSelectionView(type: type)
                        .environment(vm)
                case .search(let from, let to):
                    SegmentsView(from: from, to: to)
                case .filter:
                    FilterView()
                }
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(Router())
}
