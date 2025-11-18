//
//  StoryModel.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import UIKit

struct StoryModel: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: ImageResource
    var isSeen: Bool = false
}
