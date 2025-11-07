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
            SearchView()
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .environment(vm)
            
            if vm.findEnabled {
                CustomButton(title: "Найти") {
                    router.push(.search(
                        from: vm.fromDisplay ?? "",
                        to: vm.toDisplay ?? ""
                    ))
                }
                .padding(.horizontal, 112.5)
            }
            
            Spacer()
        }
        .background(.appWhite)
    }
}

struct SearchView: View {
    @Environment(HomeViewModel.self) private var vm
    @EnvironmentObject private var router: Router
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
           VStack(alignment: .leading, spacing: 8) {
               RouteButton(title: vm.fromDisplay, placeholder: "Откуда") {
                   router.push(.node(.fromCity))
               }
               RouteButton(title: vm.toDisplay, placeholder: "Куда") {
                   router.push(.node(.toCity))
               }
           }
           .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
           .background(.white)
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

struct RouteButton: View {
    var title: String?
    var placeholder: String
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(title ?? placeholder)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(title == nil ? .appGray : .black)
                .frame(height: 48)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Router())
        .environment(HomeViewModel())
}

