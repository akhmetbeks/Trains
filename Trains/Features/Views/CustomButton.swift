//
//  CustomButton.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 03.11.2025.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(.appBlue)
                .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomButton(title: "Найти") {
        print("Pressed")
    }
}
