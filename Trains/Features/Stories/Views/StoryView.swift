//
//  StoryView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 19.11.2025.
//

import SwiftUI

struct StoryView: View {
    @ObservedObject var viewModel: StoriesViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var toggleAnimation = false
    
    var body: some View {
        let item = viewModel.stories[viewModel.currentIndex].model
        
        ZStack(alignment: .topTrailing) {
            Image(item.image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: toggleAnimation ? 40 : 10))
                .opacity(toggleAnimation ? 1 : 0.1)
            
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
            
            VStack {
                Spacer()
                
                Text(item.title)
                    .lineLimit(2)
                    .font(.system(size: toggleAnimation ? 34 : 35, weight: .bold))
                    .padding(.bottom, 16)
                
                Text(item.subtitle)
                    .lineLimit(3)
                    .font(.system(size: toggleAnimation ? 20 : 22))
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 16)
        }
        .foregroundStyle(.white)
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                toggleAnimation.toggle()
            }
        }
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
    StoryView(viewModel: StoriesViewModel())
}
