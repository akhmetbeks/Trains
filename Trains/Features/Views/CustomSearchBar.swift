//
//  CustomSearchBar.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 21.11.2025.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    @State var isSearching: Bool = false
    var placeholder = "Введите запрос"
    
    private var prompt: Text {
        Text(placeholder).foregroundStyle(.gray)
    }
    
    var body: some View {
        let isActive = !searchText.isEmpty
        
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 17, height: 17)
                .foregroundColor(isActive ? .appBlack : .gray)
            
            TextField("", text: $searchText, prompt: prompt)
                .foregroundStyle(.appBlack)
                .font(.system(size: 17))
                .padding(.leading, 8)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                
            if isActive {
                Button(action: { searchText = "" }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .padding(2)
                        .foregroundColor(isActive ? .appBlack : .gray)
                })
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 7)
        .background(.appTextField)
        .cornerRadius(10)
        .padding(.horizontal, 12)
    }
}

#Preview {
    CustomSearchBar(searchText: .constant("какуа"))
        .background(.appWhite)
}
