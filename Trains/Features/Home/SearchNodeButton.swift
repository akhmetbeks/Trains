//
//  SearchNodeButton.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 11.11.2025.
//

import SwiftUI

struct SearchNodeButton: View {
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
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background(.white)
    }
}

#Preview {
    SearchNodeButton(title: nil, placeholder: "Куда") {}
}
