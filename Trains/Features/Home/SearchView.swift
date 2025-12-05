//
//  SearchView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 11.11.2025.
//

import SwiftUI

struct SearchView: View {
    @Environment(HomeViewModel.self) private var vm
    @EnvironmentObject private var router: Router
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
               SearchNodeButton(title: vm.fromDisplay, placeholder: "Откуда") {
                   router.push(.node(.fromCity, region: nil))
               }
               SearchNodeButton(title: vm.toDisplay, placeholder: "Куда") {
                   router.push(.node(.toCity, region: nil))
               }
           }
           .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button {
                vm.swap()
            } label: {
                Image(.сhange)
            }

       }
       .padding(16)
       .background(.appBlue)
       .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SearchView()
        .environment(HomeViewModel())
        .environmentObject(Router())
}
