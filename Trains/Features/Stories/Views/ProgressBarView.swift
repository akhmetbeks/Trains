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
    var count: Int
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(width: geometry.size.width, height: .progressBarHeight)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(
                        width: min(
                            progress * geometry.size.width,
                            geometry.size.width
                        ),
                        height: .progressBarHeight
                    )
                    .foregroundStyle(.appBlue)
            }
            .mask {
                MaskProgressBarView(count: count)
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
    ProgressBarView(count: 3, progress: 0.5)
}
