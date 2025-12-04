//
//  SettingsView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 18.11.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: Router
    @AppStorage(Constants.darkMode) private var darkMode = false
    
    var body: some View {
        VStack(spacing: 16) {
            Toggle(isOn: $darkMode) {
                Text("Темная тема")
            }
            .tint(.appBlue)
            
            HStack {
                Text("Пользовательское соглашение")
                Spacer()
                Image(.chevron)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                router.push(.agreement)
            }

            Spacer()
            
            Group {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия 1.0 (beta)")
            }
            .font(.system(size: 12))
            
        }
        .padding(16)
        .background(.appWhite)
        .foregroundStyle(.appBlack)
        .customBackButton()
        .animation(.easeInOut(duration: 0.35), value: darkMode)
    }
}

#Preview {
    SettingsView()
        .environmentObject(Router())
}
