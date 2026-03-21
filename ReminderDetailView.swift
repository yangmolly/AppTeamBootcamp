//
//  ReminderDetailView.swift
//  Project03
//
//  Created by Molly Yang on 3/20/26.
//

import SwiftUI

struct ReminderDetailView: View {
    // TODO: Fill in necessary bindings (Hint: you need 4)
    @Binding var title: String
    @Binding var description: String
    @Binding var date: Date
    @Binding var color: Color
    
    @State private var isEditing = false
    
    var body: some View {
        // TODO: Recreate the view in the write-up video
        VStack (alignment: .center){
            Text(description.isEmpty ? "No description" : description)
                .padding(.top, 60)
                .padding(.bottom, 60)
            VStack(alignment: .leading){
                Text("Title & Description")
                    .foregroundStyle(color)
                    .font(.title3.bold())
                    .padding(.horizontal, 30)
                
                VStack{
                    HStack{
                        Text("Title")
                        TextField("", text: $title)
                        
                    }
                    .padding()
                    Divider()
                    HStack{
                        Text("Description")
                        TextField("", text: $description, axis: .vertical)
                    }
                    .padding()
                }
                .background(
                        Color.secondary.opacity(0.1),
                        in: RoundedRectangle(cornerRadius: 12))
                .padding(10)
                        Text("Date")
                            .font(.title3.bold())
                            .foregroundStyle(color)
                            .padding(.horizontal, 30)
                    HStack{
                        Text("Date")
                            .padding(.leading, 10)
                        DatePicker("", selection: $date)
                    }
                    .padding(.vertical, 15)
                
                    .background(
                            Color.secondary.opacity(0.1),
                            in: RoundedRectangle(cornerRadius: 12))
                    .padding()
                    Spacer()
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
        // TODO: Add Toolbar for Todo Info
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundStyle(color)

                }
            }
            
        }
    
        .sheet(isPresented: $isEditing) {
            EditSheet(title: .constant(title), selectedColor: $color)
            //TODO: Add NavigationTitle
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
    
    #Preview {
        // TODO: Create necessary @State properties to pass into preview (Hint: use @Previewable)
        @Previewable @State var title = "PUSH DAY"
        @Previewable @State var description = "It's a healthy habit. We can skip legs"
        @Previewable @State var date = Date()
        @Previewable @State var color = Color.red
        NavigationStack {
            ReminderDetailView(title: $title,
                               description: $description,
                               date: $date,
                               color: $color)
        }
    }
