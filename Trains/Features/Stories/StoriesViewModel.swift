//
//  StoriesViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import Combine

final class StoriesViewModel: ObservableObject {
    @Published private(set) var stories: [StoryModel] = [
        StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story1
        ),
        StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story2
        ),
        StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story3
        ),
        StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story4
        ),
        StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story5
        ),
        StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story6
        )
    ]
    
    func select(_ item: StoryModel) {
        if let index = stories.firstIndex(where: { $0.id == item.id }) {
            var newItem = stories[index]
            newItem.isSeen = true
            stories[index] = newItem
        }
    }
}
