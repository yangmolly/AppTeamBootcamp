//
//  ContentView.swift
//  Project01
//
//  Created by Molly Yang on 2/14/26.
//

import SwiftUI

struct ContentView: View {
    @State private var time: Double = 0
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "chevron.down")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                Spacer()
                Text("Billie Eilish")
                    .foregroundStyle(Color.white)
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
            Spacer()
            Image("hmhas-cover")
                .resizable()
                .scaledToFit()
                .frame(width:350)
                .padding(.vertical)
            HStack {
                VStack(alignment: .leading){
                    Text("CHIHIRO")
                        .foregroundStyle(Color.white)

                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    Text("Billie Eilish")
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                }
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                    .font(.title)
                    .padding(.horizontal)
            }
            Slider(value: $time, in: 0...5.02)
                .padding(.horizontal)
                .accentColor(.white)
                .foregroundStyle(Color.white)
            HStack{
                Text("0:00")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                Spacer()
                Text("5:03")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)

            }
            HStack{
                Image(systemName: "shuffle")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .padding(.horizontal)
                    Spacer()
                Image(systemName: "backward.end.fill")
                    .foregroundStyle(Color.white)
                    .font(.title2)

                Spacer()
                Image(systemName: "play.circle.fill")
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Image(systemName: "forward.end.fill")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                Spacer()
                Image(systemName: "repeat")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                    .font(.title2)
                    .padding(.vertical)
                }
            HStack{
                Image(systemName: "hifispeaker.2")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                Image(systemName: "chart.bar.yaxis")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
            }
            Spacer()
        }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("dark-blue").gradient)
            }
            }

#Preview {
    ContentView()
}
