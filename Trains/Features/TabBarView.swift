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
                SettingsView()
                    .tabItem {
                        Label("", image: .settings)
                    }
            }
            .background(.appWhite)
            .safeAreaInset(edge: .bottom, content: {
                Divider()
                    .foregroundStyle(.black)
                    .padding(.bottom, 49)
            })
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .node(let type, let region):
                    NodeSelectionView(type: type, region: region)
                        .environment(vm)
                case .search:
                    SegmentsView()
                        .environment(vm)
                case .filter:
                    FilterView()
                case .carrier(let carrier):
                    CarrierView(carrier: carrier)
                case .agreement:
                    UserAgreement()
                }
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(Router())
}
