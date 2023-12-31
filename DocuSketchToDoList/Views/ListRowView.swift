//
//  ListRowView.swift
//  DocuSketchToDoList
//
//  Created by sihtmark on 05.08.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: Task
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = Task(title: "Preview item", isCompleted: false)
    static var item2 = Task(title: "Preview item 2", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)

    }
}

