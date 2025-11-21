//
//  SwiftUIView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 04.11.2025.
//

import SwiftUI

struct NodeSelectionView: View {
    var type: Route.Node
    
    @EnvironmentObject private var router: Router
    @Environment(HomeViewModel.self) private var vm
    
    @State private var nodeVM: NodeViewModel
    
    init(type: Route.Node) {
        self.type = type
        _nodeVM = State(initialValue: NodeViewModel(isCity: type.isCity))
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
            case .data(let items):
                List {
                    ForEach(items, id: \.self) { city in
                        HStack {
                            Text(city)
                                .font(.system(size: 17, weight: .regular))
                            Spacer()
                            Image(.chevron)
                                .foregroundColor(.appBlack)
                        }
                        .padding(.vertical, 15)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            select(city)
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
    }
    
    private func select(_ item: String) {
        switch type {
        case .fromCity:
            vm.fromCity = item
            router.push(.node(.fromStation))
        case .fromStation:
            vm.fromStation = item
        case .toCity:
            vm.toCity = item
            router.push(.node(.toStation))
        case .toStation:
            vm.toStation = item
        }
        
        if !type.isCity {
            router.popToRoot()
        }
    }
}

#Preview {
    NodeSelectionView(type: .fromCity)
        .environmentObject(Router())
        .environment(HomeViewModel())
}
