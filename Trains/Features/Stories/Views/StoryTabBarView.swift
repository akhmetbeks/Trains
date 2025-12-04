//
//  StoryTabBarView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 19.11.2025.
//

import SwiftUI

struct StoriesView: View {
    @State var viewModel: StoriesViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoryTabBarView(viewModel: viewModel)
            
            ProgressBarView(
                currentIndex: viewModel.currentIndex,
                count: viewModel.stories.count,
                progress: viewModel.progress)
            .padding(.top, 28)
            .padding(.horizontal, 12)
            
            CloseButton()
                .onTapGesture {
                    dismiss()
                }
                .padding(.top, 50)
                .padding(.horizontal, 12)
        }
    }
}

struct StoryTabBarView: View {
    @State var viewModel: StoriesViewModel
    
    var body: some View {
        TabView(selection: Binding(
            get: { viewModel.currentIndex },
            set: { id in viewModel.currentIndex = id }
        ))
            {
                ForEach(0..<viewModel.stories.count, id: \.self) { index in
                    StoryView(item: viewModel.stories[index].model)
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

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 14, weight: .bold))
            .padding(10)
            .background(
                Circle()
                    .fill(.black)
            )
            .foregroundStyle(.white)
    }
}

#Preview {
    StoryTabBarView(viewModel: StoriesViewModel())
}
