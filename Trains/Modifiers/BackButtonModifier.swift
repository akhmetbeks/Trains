//
//  backButtonModifier.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 11.11.2025.
//

import Foundation
import SwiftUI

struct BackButtonModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(.back)
                            .foregroundStyle(.appBlack)
                    }
                }
            }
    }
}

extension View {
    func customBackButton() -> some View {
        modifier(BackButtonModifier())
    }
}
