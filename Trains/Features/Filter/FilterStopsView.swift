//
//  FilterStopsView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 07.11.2025.
//

import SwiftUI

struct FilterStopsView: View {
    @Binding var showStops: Bool
    
    var body: some View {
        Text("Показывать варианты с пересадками")
            .font(.system(size: 24, weight: .bold))
            .padding(.vertical, 16)
        
        Toggle(isOn: Binding(
            get: { showStops },
            set: { newValue in
                if newValue { showStops = true }
            })
        ) {
            Text("Да")
        }
        .toggleStyle(CustomRadio())

        Toggle(isOn: Binding(
            get: { !showStops },
            set: { newValue in
                if newValue { showStops = false }
            })
        ) {
            Text("Нет")
        }
        .toggleStyle(CustomRadio())
    }
}

#Preview {
    FilterStopsView(showStops: .constant(true))
}
