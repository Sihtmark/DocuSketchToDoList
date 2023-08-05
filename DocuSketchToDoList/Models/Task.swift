//
//  ItemModel.swift
//  DocuSketchToDoList
//
//  Created by sihtmark on 05.08.2023.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    mutating func updateCompletion() {
        isCompleted.toggle()
    }
}
