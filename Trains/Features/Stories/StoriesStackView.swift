//
//  StoriesStackView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import SwiftUI

struct StoriesStackView: View {
    @StateObject private var viewModel = StoriesViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(viewModel.stories) { item in
                    StoryCellView(item: item)
                        .onTapGesture {
                            viewModel.select(item)
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StoriesStackView()
}
