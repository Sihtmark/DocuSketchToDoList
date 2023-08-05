//
//  ListView.swift
//  DocuSketchToDoList
//
//  Created by sihtmark on 05.08.2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            if vm.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(vm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    vm.updateTask(item: item)
                                }
                            }
                    }
                    .onDelete(perform: vm.deleteTask)
                    .onMove(perform: vm.moveTask)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Список дел ✅")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Добавить", destination: { AddView() })
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ViewModel())
    }
}

