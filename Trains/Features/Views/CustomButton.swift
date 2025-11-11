//
//  CustomButton.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 03.11.2025.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var innerPadding: CGFloat?
    var maxWidth: CGFloat?
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal, innerPadding ?? 0.0)
                .frame(maxWidth: maxWidth)
                .frame(height: 60)
                .background(.appBlue)
                .cornerRadius(16)
                
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomButton(title: "Найти", action: {
        
    })
}
