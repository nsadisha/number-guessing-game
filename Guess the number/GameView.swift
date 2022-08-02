//
//  NumberGuessingView.swift
//  Demo
//
//  Created by Sadisha Nimsara on 2022-08-01.
//

import SwiftUI

struct GameView: View {
    
    private let range = 0...100
    
    @State private var showingAlert = false
    @State private var showingWinningAlert = false
    @State private var number = Int.random(in: 0...100)
    @State private var selectedValue = ""
    @State private var instructionText = "Enter a number between 0 and 100 and click the bellow button to continue."
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Guess the number")
                    .font(.largeTitle)
                
                Spacer()
                
                TextField("Enter number", text: $selectedValue)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .font(Font.system(size: 35))
                    
                Spacer()
                
                Text(instructionText)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20.0)
            
                Button {
                    if selectedValue == "" {
                        showingAlert = true
                        return
                    }
                let intSelection = Int(selectedValue)
                    if intSelection == number{
                        showingWinningAlert = true
                        number = randomInt()
                    }else if intSelection! > number {
                        if intSelection! - number >= 10 {
                            instructionText = "Try a lower number."
                        }else if intSelection! - number < 3 {
                            instructionText = "You almost got it! Just a little lower."
                        } else{
                            instructionText = "A little lower."
                        }
                    }else{
                        if number - intSelection! >= 10 {
                            instructionText = "Try a higher number"
                        }else if number - intSelection! < 3 {
                            instructionText = "You almost got it! Just a little higher."
                        }else{
                            instructionText = "A little higher"
                        }
                    }
                } label: {
                    Text("Guess the number")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .padding(.bottom, 5)
                        .background(Color.purple)
                }
                    .cornerRadius(10)
                    .alert("Please Enter a number between \(range.lowerBound) and \(range.upperBound)", isPresented: $showingAlert) {Button("OK", role: .cancel) {
                        showingAlert = false
                    }}
                    .alert("Congratulations! You won the game.", isPresented: $showingWinningAlert) {Button("OK", role: .cancel) {
                        showingWinningAlert = false
                        selectedValue = ""
                        instructionText = "Enter a number between 0 and 100 and click the bellow button to continue."
                    }}
            }
            .padding(.horizontal, 15)
        }
    }
    
    func randomInt() -> Int{
        return Int.random(in: range)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
