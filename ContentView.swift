//
//  ContentView.swift
//  Project03
//
//  Created by Molly Yang on 3/18/26.
//

import SwiftUI

struct ContentView: View {
        @State private var isEditing: Bool = false
        // TODO: Add an @State property to hold a RemindersPage struct
        @State private var page: RemindersPage =  RemindersPage(
            title: "To-Do List",
            items: [
                Reminder(title: "Push Day", description: "it's a healthy habit", date: Date()),
                Reminder(title: "Complete compilers Lab", description: "it's a healthy habit", date: Date()),
                Reminder(title: "Finish Cupboard ticket", description: "it's a healthy habit", date: Date()),
                Reminder(title: "Feed sugar pig", description: "it's a healthy habit", date: Date())
            ],
            color: .yellow
        )
        
        var body: some View {
            NavigationStack{
            VStack {
                // TODO: Add header view
                HStack{
                    Text(page.title)
                        .padding(.leading, 20)
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(page.color)
                    Spacer()
                    Button {
                        isEditing = true // This triggers the sheet
                    } label: {
                        Image(systemName: "info.circle")
                            .font(Font.system(size: 25))
                            .padding(.trailing, 20)
                            .foregroundStyle(page.color)
                    }
                }
                List {
                    // TODO: Loop through the page's reminders using ForEach
                    ForEach($page.items) { $reminder in
                        // TODO: Display each reminder row
                        NavigationLink {
                                ReminderDetailView(
                                    title: $reminder.title,
                                    description: $reminder.description,
                                    date: $reminder.date,
                                    color: $page.color
                                )
                            } label: {
                                HStack {
                                    Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(page.color)
                                        .font(.system(size: 20))
                                        .onTapGesture {
                                            reminder.isCompleted.toggle()
                                        }
                                    
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Text(reminder.title)
                                            Spacer()
                                            Text(reminder.date, style: .relative)
                                        }
                                    }
                                }
                            }
                    }
                    
                    .onDelete { indexSet in
                        page.items.remove(atOffsets: indexSet)
                    }
                    .listStyle(.plain)
                }
                // TODO: Add footer view
                HStack{
                    Spacer()
                    Button {
                        page.items.append(Reminder(title: "", description: " ", date: Date()))
                    } label: {
                        Image(systemName: "plus.circle.fill").font(.system(size: 40))
                            .foregroundStyle(page.color)
                            .padding(.trailing, 20)
                    }
                }
            }
            .sheet(isPresented: $isEditing) {
                // TODO: Add remaining binding
                EditSheet(title: $page.title, selectedColor: $page.color)
            }
        }
    }
}

#Preview {
    ContentView()
}
