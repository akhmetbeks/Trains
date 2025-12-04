//
//  StoryView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 19.11.2025.
//

import SwiftUI

struct StoryView: View {
    var item: StoryModel
    @State private var toggleAnimation = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: toggleAnimation ? 40 : 10))
                .opacity(toggleAnimation ? 1 : 0.1)
            
            VStack {
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

#Preview {
    StoryView(item: StoryModel(
        title: "Text Text Text Text Text Text Text Text Text Text",
        subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
        image: .story1
    ))
}
