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
    
    @State private var searchText: String = ""
    
    private var filteredList: [String] {
        let items = type.isCity ? vm.cities : vm.stations
        if searchText.isEmpty { return items }
        return items.filter({ $0.lowercased().contains(searchText.lowercased()) })
    }
    
    var body: some View {
        List {
            if filteredList.isEmpty {
                Text(type.noResult)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                ForEach(filteredList, id: \.self) { city in
                    HStack {
                        Text(city)
                            .font(.system(size: 17, weight: .regular))
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.appBlack)
                    }
                    .padding(.vertical, 15)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        select(city)
                    }
                    .listRowSeparator(.hidden)
                    .background(Color(.appWhite))
                }
            }
        }
        .background(Color(.appWhite))
        .listStyle(.plain)
        .navigationTitle(type.title)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, prompt: "Введите запрос")
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
