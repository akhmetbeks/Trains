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
        VStack {
            Text("\(from) → \(to)")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.appBlack)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
            
            ZStack(alignment: .bottom) {
                if vm.segments.isEmpty {
                    Text("Вариантов нет")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.appBlack)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .multilineTextAlignment(.center)
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(vm.segments, id: \.self) { segment in
                                SegmentView(segment: segment, formatter: formatter)
                            }
                        }
                        .padding(.bottom, 70)
                    }
                }
                
                CustomButton(title: "Уточнить время", maxWidth: .infinity) {
                    router.push(.filter)
                }
            }
        }
        .padding(16)
        .background(.appWhite)
        .task {
            try? await vm.fetchSchedule(from: "c146", to: "c213")
        }
        .customBackButton()
    }
}

#Preview {
    SegmentsView(from: "Симферополь", to: "Алматы")
        .environmentObject(Router())
}
