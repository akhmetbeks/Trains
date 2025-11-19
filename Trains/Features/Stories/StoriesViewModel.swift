//
//  StoriesViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import Combine
import SwiftUI

final class StoriesViewModel: ObservableObject {
    @Published private(set) var stories: [StoryModelItem]
    @Published private(set) var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @Published var progress: CGFloat = 0
    private(set) var cancellable: Cancellable?
    private(set) var currentStory: StoryModelItem?
    private(set) var progressConfig: ProgressConfiguration
    
    init() {
        self.stories = storiesList
        self.progressConfig = ProgressConfiguration(storiesCount: storiesList.count)
        createTimer(progressConfig)
    }
    
    deinit {
        self.cancellable?.cancel()
    }
    
    var selectedStory: Binding<UUID> {
        Binding {
            self.stories.first(where: { $0.model.active == true })?.id ?? self.stories.first!.id
        } set: { newID in
            self.select(by: newID)
        }
    }
    
    private func createTimer(_ config: ProgressConfiguration) {
        cancellable?.cancel()
        self.timer = Timer.publish(every: config.timerTickInternal, on: .main, in: .common)
        self.cancellable = timer.connect()
    }
    
    func timerTick() {
        var nextProgress = progress + progressConfig.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
        }
        progress = nextProgress
    }
    
    func select(by id: UUID) {
        if let item = stories.first(where: { $0.id == id }) {
            for story in stories {
                story.model.active = false
            }
            
            currentStory = item
            currentStory?.model.active = true
            currentStory?.model.isSeen = true
        }
    }
    
    func nextStory() {
        if let currentStoryIndex = stories.firstIndex(where: { $0.id ==  currentStory?.id }) {
            let nextStoryIndex = currentStoryIndex + 1
            if nextStoryIndex < stories.count {
                currentStory = stories[currentStoryIndex]
            } else {
                currentStory = stories.first
            }
            
            if let id = currentStory?.id {
                select(by: id)
            }
        }
    }
    
    func resetTimer() {
        createTimer(progressConfig)
    }
}


let storiesList = [
    StoryModelItem(
        model: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story1
        ),
    ),
    StoryModelItem(
        model: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story2
        ),
    ),
    StoryModelItem(
        model: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story3
        ),
    ),
    StoryModelItem(
        model: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story4
        ),
    ),
    StoryModelItem(
        model: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story5
        ),
    ),
    StoryModelItem(
        model: StoryModel(
            title: "Text Text Text Text Text Text Text Text Text Text",
            subtitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            image: .story6
        ),
    ),
]
