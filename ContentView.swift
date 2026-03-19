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
            Reminder(title: "Get groceries"),
            Reminder(title: "Complete compilers Lab"),
            Reminder(title: "Finish Cupboard ticket"),
            Reminder(title: "Feed sugar pig")
        ],
        color: .yellow
            )
    
    var body: some View {
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
                    HStack{
                        Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(page.color)
                            .font(.system(size: 20))
                            .onTapGesture {
                                reminder.isCompleted.toggle()}
                        TextField("Reminder", text: $reminder.title)
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
                    page.items.append(Reminder(title: ""))
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

#Preview {
    ContentView()
}
