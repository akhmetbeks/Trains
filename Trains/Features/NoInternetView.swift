//
//  NoInternetView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 08.11.2025.
//

import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(.noInternet)
                .padding(.bottom, 16)
            Text("Нет интернета")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.appBlack)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appWhite)
    }
}

#Preview {
    NoInternetView()
}
