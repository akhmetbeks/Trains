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
        TabView(selection: Binding(
            get: { viewModel.currentIndex },
            set: { id in viewModel.currentIndex = id }
        ))
            {
                ForEach(0..<viewModel.stories.count, id: \.self) { index in
                    StoryView(viewModel: viewModel)
                        .tag(index)
            }
        }
            .onChange(of: viewModel.currentIndex, { oldValue, newValue in
                viewModel.nextStory(at: newValue)
            })
            .onReceive(viewModel.timer) { _ in
                viewModel.timerTick()
            }
            .onTapGesture {
                viewModel.nextStory()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background(.black)
    }
}

#Preview {
    StoryTabBarView(viewModel: StoriesViewModel())
}
