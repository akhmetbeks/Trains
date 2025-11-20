//
//  BarView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 19.11.2025.
//

import SwiftUI

extension CGFloat {
    static let progressBarCornerRadius: CGFloat = 6
    static let progressBarHeight: CGFloat = 6
}

struct ProgressBarView: View {
    var currentIndex: Int
    var count: Int
    var progress: CGFloat
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<count, id: \.self) { index in
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                            .foregroundStyle(.white)
                        
                        if index < currentIndex {
                            RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                                .foregroundStyle(.appBlue)
                        }
                            
                        if index == currentIndex {
                            RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                                .foregroundStyle(.appBlue)
                                .frame(width: geometry.size.width * progress)
                        }
                    }
                }
                .frame(height: .progressBarHeight)
            }
        }
    }
}

struct MaskProgressBarView: View {
    var count: Int
    
    var body: some View {
        HStack {
            ForEach(0..<self.count, id: \.self) { _ in
                MaskBarView()
            }
        }
    }
}

struct MaskBarView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: .progressBarCornerRadius)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: .progressBarHeight)
            .foregroundStyle(.white)
    }
}

#Preview {
    ProgressBarView(currentIndex: 1, count: 3, progress: 0.35)
}
