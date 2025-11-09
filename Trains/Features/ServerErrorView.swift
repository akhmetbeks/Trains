//
//  ServerErrorView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 08.11.2025.
//

import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(.serverError)
                .padding(.bottom, 16)
            Text("Ошибка сервера")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.appBlack)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appWhite)
    }
}

#Preview {
    ServerErrorView()
}
