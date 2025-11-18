//
//  TrainsApp.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 20.10.2025.
//

import SwiftUI

@main
struct TrainsApp: App {
    @AppStorage(Constants.darkMode) private var darkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}
