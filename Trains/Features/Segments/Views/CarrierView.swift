//
//  SegmentInfoView.swift
//  Trains
//
//  Created by Sultan Akhmetbek on 07.11.2025.
//

import SwiftUI

struct CarrierView: View {
    var carrier: Carrier
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomAsyncImage(url: carrier.logo)
                .frame(maxWidth: .infinity, maxHeight: 104, alignment: .center)
                .padding(.bottom, 16)
            
            Text(carrier.title ?? "")
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 16)
                
            Text("E-mail")
            Text(carrier.email ?? "")
                .font(.system(size: 12))
                .foregroundStyle(.appBlue)
                .padding(.bottom, 16)
            
            Text("Телефон")
            Text(carrier.phone ?? "")
                .font(.system(size: 12))
                .foregroundStyle(.appBlue)
                .padding(.bottom, 16)
   
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.appWhite)
        .navigationTitle("Информация о перевозчике")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CarrierView(carrier: .init(
        code: 1,
        contacts: "No Info",
        title: "Test Carrier",
        phone: "+7 (904) 329-27-71",
        address: "i.lozgkina@yandex.ru",
        logo: "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?semt=ais_hybrid&w=740&q=80",
        email: "test@gmail.com"
    ))
}
