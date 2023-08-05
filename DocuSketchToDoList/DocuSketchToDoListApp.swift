//
//  DocuSketchToDoListApp.swift
//  DocuSketchToDoList
//
//  Created by sihtmark on 05.08.2023.
//

import SwiftUI

@main
struct DocuSketchToDoListApp: App {
    
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(vm)
        }
    }
}
