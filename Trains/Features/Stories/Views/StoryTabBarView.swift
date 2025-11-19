//
//  StoryTabBarView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 19.11.2025.
//

import SwiftUI

struct StoryTabBarView: View {
    @ObservedObject var viewModel: StoriesViewModel
    
    var body: some View {
        TabView(selection: viewModel.selectedStory) {
            ForEach(viewModel.stories) { item in
                StoryView(
                    item: item.model,
                    progress: $viewModel.progress
                )
                    .tag(item.id)
                    .onAppear {
                        viewModel.select(by: item.id)
                    }
                    .onReceive(viewModel.timer) { _ in
                        viewModel.timerTick()
                    }
                    .onTapGesture {
                        viewModel.nextStory()
                        viewModel.resetTimer()
                    }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(.black)
    }
}

#Preview {
    StoryTabBarView(viewModel: StoriesViewModel())
}
