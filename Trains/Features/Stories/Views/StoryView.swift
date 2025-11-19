//
//  StoryView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 19.11.2025.
//

import SwiftUI

struct StoryView: View {
    var item: StoryModel
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(item.image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 40))
            
            ProgressBarView(count: 3, progress: progress)
                .padding(.top, 28)
                .padding(.horizontal, 12)
            
            CloseButton()
                .padding(.top, 50)
                .padding(.horizontal, 12)
            
            VStack {
                Spacer()
                
                Text(item.title)
                    .lineLimit(2)
                    .font(.system(size: 34, weight: .bold))
                    .padding(.bottom, 16)
                
                Text(item.subtitle)
                    .lineLimit(3)
                    .font(.system(size: 20))
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 16)
        }
        .foregroundStyle(.white)
    }
}

struct CloseButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 14, weight: .bold))
            .padding(10)
            .background(
                Circle()
                    .fill(.black)
            )
            .foregroundStyle(.white)
            .onTapGesture {
                dismiss()
            }
    }
}

#Preview {
    StoryView(
        item: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story3),
        progress: .constant(0.5)
    )
}
