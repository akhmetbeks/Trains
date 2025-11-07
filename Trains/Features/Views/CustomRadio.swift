//
//  CustomRadioStyle.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 07.11.2025.
//

import SwiftUI

struct CustomRadio: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
                    .foregroundStyle(.appBlack)
                Spacer()
                Image(configuration.isOn ? .radioFilled : .radio)
                    .foregroundStyle(.appBlack)
            }
        }
        .buttonStyle(.plain)
    }
}
