//
//  HourlyForecast.swift
//  Project02
//
//  Created by Molly Yang on 2/22/26.
//
import SwiftUI
struct Hour: Identifiable{
    let id = UUID()
    var time: String
    var icon: String
    var temp: Int
}


struct HourView: View {
    let hour : Hour
    var body: some View {
        VStack{
            Text(hour.time)
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
            Image(systemName: hour.icon)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 20))
            Text("\(hour.temp)°")
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
        }
        .padding(12)
    }
}
struct HourlyForecast: View{
    let hourly = [
        Hour(time: "Now", icon: "sun.max.fill", temp: 54),
        Hour(time: "1PM", icon: "sun.max.fill", temp: 54),
        Hour(time: "2PM", icon: "sun.max.fill", temp: 54),
        Hour(time: "3PM", icon: "cloud.sun.fill", temp: 54),
        Hour(time: "4PM", icon: "sun.max.fill", temp: 54),
    ]
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Image(systemName: "clock")
                    .foregroundStyle(Color.white)
                Text("Hourly Forecast")
                    .foregroundStyle(Color.white)
            }
            HStack{
                ForEach(hourly) { item in
                    HourView(hour: item)
                }
            }
        }
            .padding(5)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            .padding(.horizontal, 12)
    }
}
