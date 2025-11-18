//
//  StoryCell.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import SwiftUI

struct StoryCellView: View {
    var item: StoryModel
    
    var body: some View {
        let lineWidth: CGFloat = item.isSeen ? 0 : 4
        let opacity = item.isSeen ? 0.5 : 1.0
        
        Image(item.image)
            .resizable()
            .frame(width: 92, height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(.appBlue, lineWidth: lineWidth))
            .opacity(opacity)
    }
}

#Preview {
    Group {
        StoryCellView(item: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story4
        ))
        
        StoryCellView(item: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story6,
            isSeen: true
        ))
    }
}
