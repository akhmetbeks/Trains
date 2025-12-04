//
//  StoryCell.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import SwiftUI

struct StoryCellView: View {
    @ObservedObject var item: StoryModelItem
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.model.image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(.appBlue, lineWidth: item.model.isSeen ? 0 : 4)
                )
                .opacity(item.model.isSeen ? 0.5 : 1.0)
            
            Text(item.model.title)
                .lineLimit(3)
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
        }
        .frame(width: 92, height: 140)
    }
}

#Preview {
    Group {
        StoryCellView(
            item: StoryModelItem(
                model: StoryModel(
                title: "Text Text Text Text Text Text Text Text Text Text",
                subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                image: .story4)
            )
        )
        
        StoryCellView(
            item: StoryModelItem(
                model: StoryModel(
                title: "Text Text Text Text Text Text Text Text Text Text",
                subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                image: .story6,
                isSeen: true)
            )
        )
    }
}
