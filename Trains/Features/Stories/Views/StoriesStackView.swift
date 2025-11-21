//
//  StoriesStackView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import SwiftUI

struct StoriesStackView: View {
    @StateObject private var viewModel = StoriesViewModel()
    @EnvironmentObject private var router: Router
    @State private var showStory = false
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(viewModel.stories) { item in
                    StoryCellView(item: item)
                        .onTapGesture {
                            viewModel.selectStory(with: item.id)
                            showStory = true
                        }
                        .fullScreenCover(isPresented: $showStory) {
                            StoriesView(viewModel: viewModel)
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
