//
//  CustomCheckbox.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 07.11.2025.
//

import SwiftUI

struct CustomCheckbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
                    .foregroundStyle(.appBlack)
                Spacer()
                Image(configuration.isOn ? .checkboxFilled : .checkbox)
                    .foregroundStyle(.appBlack)
            }
        }
        .buttonStyle(.plain)
    }
}
