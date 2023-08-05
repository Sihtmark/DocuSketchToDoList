//
//  AddView.swift
//  DocuSketchToDoList
//
//  Created by sihtmark on 05.08.2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Текст задачи", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 56)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Сохранить".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(16)
                }
            }
            .padding(16)
        }
        .navigationTitle("Добавить задачу")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if (textIsAppropiate()) {
            listViewModel.addTask(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropiate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Длина текста должна быть хотя бы три символа 😨"
            showAlert.toggle()
            
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ViewModel())
    }
}
