//
//  StoryModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import UIKit
import Combine

struct StoryModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: ImageResource
    var isSeen: Bool = false
}

final class StoryModelItem: ObservableObject, Identifiable {
    @Published var model: StoryModel
    
    init(model: StoryModel) {
        self.model = model
    }
    
    var id: UUID { model.id }
}
