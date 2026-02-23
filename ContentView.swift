//
//  ContentView.swift
//  Project02
//
//  Created by Molly Yang on 2/18/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack {
                HStack{
                    Text("10:58")
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                    Spacer()
                    Image(systemName: "wifi")
                        .foregroundStyle(Color.white)
                    Image(systemName: "battery.100percent")
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                }
                .ignoresSafeArea()
                .padding(.top, 1)
                CurrentTemp()
                    .padding(.top, 20)
                Spacer()
                HourlyForecast()
                    .padding(.bottom, 10)
                DailyForecast()
                    .padding(.bottom, 10)
            }
            .background((Color.blue).gradient)
        
        }
}

#Preview {
    ContentView()
}
