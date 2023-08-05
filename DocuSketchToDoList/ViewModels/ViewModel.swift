//
//  ViewModel.swift
//  DocuSketchToDoList
//
//  Created by sihtmark on 05.08.2023.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var items: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Task].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteTask(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String) {
        let newItem = Task(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateTask(item: Task) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].updateCompletion()
        }
    }
    
    func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
