//
//  ContentView.swift
//  Demo
//
//  Created by Sadisha Nimsara on 2022-07-28.
//

import SwiftUI

struct StartScreen: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Spacer()
                
                Section {
                    Image("thinking")
                        .resizable()
                    .frame(width: 200, height: 200)
                    
                    Text("Guess the number")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                NavigationLink(destination: GameView()){
                    Text("Enter the game")
                }.padding(.bottom, 20)
                
            }
        }
        
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
