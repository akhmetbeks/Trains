//
//  ErrorView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 11.11.2025.
//

import SwiftUI

struct ErrorView: View {
    var type: ErrorType
    
    var body: some View {
        VStack(alignment: .center) {
            Image(type.image)
                .padding(.bottom, 16)
            Text(type.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.appBlack)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appWhite)
    }
}

#Preview {
    Group {
        ErrorView(type: .noInternet)
        ErrorView(type: .serverError)
    }
}
