//
//  ContentView.swift
//  Project06
//
//  Created by Molly Yang on 3/29/26.
//

import SwiftUI

struct Question: Codable, Hashable {
    let question: String
    let A: String
    let B: String
    let C: String
    let D: String
    let answer: String
}

struct ContentView: View {
    // store questions
    @State private var questions: [Question] = []

    var body: some View {
        // Add NavigationLink to QuestionView for each question
        NavigationStack {
            List(questions, id: \.self) { item in
                NavigationLink(destination: QuestionDetailView(question: item)) {
                    Text(item.question)
                        .lineLimit(1)
                }
            }
            // Add navigationTitle
            // Add shuffle button in toolbar
            .navigationTitle("Trivvey")
            .toolbar {
                Button { questions.shuffle() } label: {
                    Image(systemName: "shuffle")
                }
            }
        }
        .onAppear { loadData() }
    }
    // decode the questions
    func loadData() {
        if let url = Bundle.main.url(forResource: "trivveyquestions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                self.questions = try JSONDecoder().decode([Question].self, from: data)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct QuestionDetailView: View {
    let question: Question
    @State private var selectedAnswer: String? = nil
    
    var options: [(id: String, text: String)] {
        [("A", question.A), ("B", question.B), ("C", question.C), ("D", question.D)]
    }

    var body: some View {
        VStack(spacing: 20) {
            Text(question.question)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding()

            VStack(spacing: 15) {
                ForEach(options, id: \.id) { option in
                    Button {
                        selectedAnswer = option.id
                    } label: {
                        HStack {
                            Text("\(option.id): \(option.text)")
                                .foregroundColor(.primary)
                                .font(.headline)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(backgroundColor(for: option.id))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: selectedAnswer == option.id ? 2 : 0)
                        )
                    }
                }
            }
            .padding()

            if let selected = selectedAnswer {
                if selected == question.answer {
                    Text("Correct!").font(.title).foregroundColor(.green)
                } else {
                    Text("Try again!").font(.title3).foregroundColor(.red)
                }
            }

            Spacer()
        }
    }

    func backgroundColor(for letter: String) -> Color {
        if selectedAnswer == nil { return Color.secondary.opacity(0.1) }
        if letter == selectedAnswer {
            return letter == question.answer ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
        }
        return Color.secondary.opacity(0.1)
    }
}

#Preview {
    ContentView()
}
