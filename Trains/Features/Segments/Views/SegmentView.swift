//
//  SegmentCardView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//

import SwiftUI

struct SegmentView: View {
    var segment: Segment
    var formatter: DateFormatter
    func formatTime(_ time: String?) -> String {
        guard let time = time else { return "-" }
        let components = time.split(separator: ":")
        guard components.count >= 2 else { return time }
        return "\(components[0]):\(components[1])"
    }
    
    var body: some View {
        let hours = {
            (segment.duration ?? 0) / 3600
        }()
        
        VStack {
            HStack {
                CustomAsyncImage(url: segment.thread?.carrier?.logo)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 38, height: 38)
                    .padding(.trailing, 8)
                
                Text(segment.thread?.carrier?.title ?? "")
                
                Spacer()
                Text(segment.startDateToString(formatter: formatter))
                    .font(.system(size: 12))
            }
            .padding(.bottom, 14)
            
            HStack {
                Text(formatTime(segment.departure))
                Rectangle()
                    .fill(.appGray)
                    .frame(width: 60, height: 1)
                Text("\(hours) часов")
                    .font(.system(size: 12))
                Rectangle()
                    .fill(.appGray)
                    .frame(width: 60, height: 1)
                Text(formatTime(segment.arrival))
            }
        }
        .padding(14)
        .background(.appLightGray)
        .foregroundStyle(.black)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}


