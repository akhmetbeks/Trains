//
//  CarriersView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 06.11.2025.
//

import SwiftUI

struct SegmentsView: View {
    var from: String
    var to: String
    @EnvironmentObject private var router: Router
    @State private var vm = SegmentsViewModel()
    private let formatter = DateFormatter()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("\(from) → \(to)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.appBlack)
                    .padding(.bottom, 8)
                
                ScrollView {
                    LazyVStack {
                        ForEach(vm.segments, id: \.self) { segment in
                            SegmentView(segment: segment, formatter: formatter)
                        }
                    }
                }
            }
            
            CustomButton(title: "Уточнить время") {
                router.push(.filter)
            }
        }
        .padding(16)
        .task {
            try? await vm.fetchSchedule(from: "c146", to: "c213")
        }
    }
}

#Preview {
    SegmentsView(from: "Симферополь", to: "Алматы")
}
