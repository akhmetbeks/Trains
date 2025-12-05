//
//  SwiftUIView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 04.11.2025.
//

import SwiftUI

struct NodeSelectionView: View {
    var type: Route.Node
    var region: String?
    
    @EnvironmentObject private var router: Router
    @Environment(HomeViewModel.self) private var vm
    
    @State private var nodeVM: NodeViewModel
    
    init(type: Route.Node, region: String?) {
        self.type = type
        self.region = region
        _nodeVM = State(initialValue: NodeViewModel(isCity: type.isCity, selectedRegion: region))
    }
    
    var body: some View {
        VStack {
            CustomSearchBar(searchText: $nodeVM.searchText)
            
            switch nodeVM.state {
            case .empty:
                Text(type.noResult)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            case .data:
                List {
                    ForEach(nodeVM.items, id: \.self) { item in
                        HStack {
                            Text(item.title)
                                .font(.system(size: 17, weight: .regular))
                            Spacer()
                            Image(.chevron)
                                .foregroundColor(.appBlack)
                        }
                        .padding(.vertical, 15)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            select(item)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
        .background(Color(.appWhite))
        .navigationTitle(type.title)
        .customBackButton()
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                try await nodeVM.loadStationsList()
            } catch {
                print("Failed to load stations: \(error.localizedDescription)")
            }
        }
    }
    
    private func select(_ item: NodeModel) {
        switch type {
        case .fromCity:
            vm.fromCity = item
            router.push(.node(.fromStation, region: item.title))
        case .fromStation:
            vm.fromStation = item
        case .toCity:
            vm.toCity = item
            router.push(.node(.toStation, region: item.title))
        case .toStation:
            vm.toStation = item
        }
        
        if !type.isCity {
            router.popToRoot()
        }
    }
}

#Preview {
    NodeSelectionView(type: .fromCity, region: "")
        .environmentObject(Router())
        .environment(HomeViewModel())
}
