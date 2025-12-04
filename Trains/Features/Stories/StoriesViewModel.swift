//
//  StoriesViewModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import SwiftUI
import Combine

@Observable
final class StoriesViewModel {
    private(set) var stories: [StoryModelItem]
    private(set) var timer: Timer.TimerPublisher
    var progress: CGFloat = 0
    var currentIndex: Int = 0
    private(set) var cancellable: Cancellable?
    private(set) var progressConfig: ProgressConfiguration
    
    init() {
        let stories = storiesList
        let config = ProgressConfiguration(storiesCount: stories.count)
        let timer = Timer.publish(every: config.timerTickInternal, on: .main, in: .common)
        let cancellable = timer.connect()
        
        self.stories = stories
        self.progressConfig = config
        self.timer = timer
        self.cancellable = cancellable
    }
    
    deinit {
        self.cancellable?.cancel()
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        self.timer = Timer.publish(every: progressConfig.timerTickInternal, on: .main, in: .common)
        cancellable = timer.connect()
        progress = 0
    }
    
    private func setStoryAsSeen() {
        stories[currentIndex].model.isSeen = true
    }
    
    func selectStory(with id: UUID) {
        if let index = stories.firstIndex(where: { $0.id == id }) {
            currentIndex = index
            setStoryAsSeen()
        }
    }
    
    func nextStory(at index: Int? = nil) {
        let nextIndex = index ?? currentIndex + 1
        
        currentIndex = nextIndex < stories.count ? nextIndex : 0
        
        setStoryAsSeen()
        resetTimer()
    }
    
    func timerTick() {
        var nextProgress = progress + progressConfig.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
            nextStory()
        }
        progress = nextProgress
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
