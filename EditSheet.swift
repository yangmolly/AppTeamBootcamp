//
//  EditSheet.swift
//  Project03
//
//  Created by Molly Yang on 3/18/26.
//
import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var title: String
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            VStack {
                Text("List Info")
                    .font(Font.largeTitle)
                    .padding()
                Image(systemName: "list.bullet.circle.fill")
                    .font(Font.system(size: 100))
                TextField("List Name", text: $title)
                    .font(.largeTitle)
                    .padding(30)
            }
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedColor: Color = .red
    @Previewable @State var title: String = "To-Do List"
    
    EditSheet(title: $title, selectedColor: $selectedColor)
        .preferredColorScheme(.dark)
}
