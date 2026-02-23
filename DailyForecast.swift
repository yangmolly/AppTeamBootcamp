//
//  DailyForecast.swift
//  Project02
//
//  Created by Molly Yang on 2/22/26.
//
import SwiftUI
struct Day: Identifiable{
    let id = UUID()
    var day: String
    var icon: String
    var lowtemp: Int
    var hightemp: Int
}

struct DayView: View {
    let day : Day
    var body: some View {
        HStack{
            Text(day.day)
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
            Spacer()
            Image(systemName: day.icon)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 20))
            Spacer()
            Text("\(day.lowtemp)°")
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 85, height: 4)
            Spacer()
            Text("\(day.hightemp)°")
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
                .padding(.horizontal)
        }
    }
}
struct DailyForecast: View{
        let forecasts = [
            Day(day: "Today", icon: "cloud.fill", lowtemp: 45, hightemp: 57 ),
            Day(day: "Mon", icon: "sun.max.fill", lowtemp: 54, hightemp: 70 ),
            Day(day: "Tue", icon: "cloud.rain.fill", lowtemp: 43, hightemp: 52 ),
            Day(day: "Wed", icon: "cloud.rain.fill", lowtemp: 33, hightemp: 45 ),
            Day(day: "Thu", icon: "sun.max.fill", lowtemp: 28, hightemp: 32 ),
            Day(day: "Fri", icon: "cloud.rain.fill", lowtemp: 25, hightemp: 33)
        ]
        var body: some View {
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "calendar")
                        .foregroundStyle(Color.white)
                    Text("10-DAY FORECAST")
                        .foregroundStyle(Color.white)
                }
                VStack{
                    ForEach(forecasts) { item in
                        DayView(day: item)
                            .padding(5)
                    }
                }
            }
            .padding(11)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            .padding(.horizontal)
        }
    }
