//
//  NoItemsView.swift
//  DocuSketchToDoList
//
//  Created by sihtmark on 05.08.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor: Color = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Text("Здесь пока нет задач!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 24)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Добавить задачу 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(16)
                }
                .padding(.horizontal, animate ? 32 : 56)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 32 : 16,
                    x: 0,
                    y: animate ? 56 : 16)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -8 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}

