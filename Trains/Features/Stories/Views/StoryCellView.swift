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
        Image(item.model.image)
            .resizable()
            .frame(width: 92, height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(.appBlue, lineWidth: item.model.isSeen ? 0 : 4)
            )
            .opacity(item.model.isSeen ? 0.5 : 1.0)
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
