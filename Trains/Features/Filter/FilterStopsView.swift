//
//  FilterStopsView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 07.11.2025.
//

import SwiftUI

struct FilterStopsView: View {
    @Binding var stopOption: Filter.Stop
    
    var body: some View {
        Text("Показывать варианты с пересадками")
            .font(.system(size: 24, weight: .bold))
            .padding(.vertical, 16)
        
        VStack {
            ForEach(Filter.Stop.allCases, id: \.self) { option in
                Toggle(isOn: Binding(
                    get: { stopOption == option },
                    set: { newValue in
                        if newValue { stopOption = option }
                    })
                ) {
                    Text(option.rawValue)
                }
                .padding(.vertical, 15)
                .toggleStyle(CustomRadio())
            }
        }
    }
}

#Preview {
    FilterStopsView(stopOption: .constant(.no))
}
