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
    
    var body: some View {
        let hours = {
            (segment.duration ?? 0) / 3600
        }()
        
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.appGray)
                    .frame(width: 38, height: 38)
                    .padding(.trailing, 8)
                
                Text(segment.thread?.carrier?.title ?? "")
                
                Spacer()
                Text(segment.startDateToString(formatter: formatter))
                    .font(.system(size: 12))
            }
            .padding(.bottom, 14)
            
            HStack {
                Text(segment.departure ?? "-")
                Text("-")
                    .frame(width: .infinity)
                Text("\(hours) часов")
                    .font(.system(size: 12))
                Text("-")
                    .frame(width: .infinity)
                Text(segment.arrival ?? "-")
            }
            .frame(width: .infinity)
        }
        .padding(14)
        .background(.appLightGray)
        .foregroundStyle(.black)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
