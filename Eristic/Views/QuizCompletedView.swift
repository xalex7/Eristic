//
//  QuizCompletedView.swift
//  Eristic
//
//  Created by Fady A Eid on 11/26/23.
//

import Foundation
import SwiftUI

// View displayed when the quiz is completed
struct QuizCompletedView: View {
    // GameManagerVM instance for managing game state
    var gameManagerVM: GameManagerVM
    @State var isPressed = false // State variable for button press animation
    
    // Body of the view
    var body: some View {
        VStack {
            // Game controller icon with bounce effect
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.orange)
                .font(.system(size: 70))
                .symbolEffect(.bounce, value: isPressed)
                .padding()
            
            // Display final score
            HStack {
                ReusableText(text: "Final score", font: .title, color: .blue)
                ReusableText(text: String(gameManagerVM.score), font: .title, color: .blue)
            }
            
            // Display message based on incorrect answers
            ReusableText(text: gameManagerVM.incorrectAnswers >= 3
                         ? "Better luck next time"
                         : "Thank you for playing!",
                         font: .title2, color: .black)
                .padding()
            
            // Play Again button with bounce effect
            Button {
                isPressed.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    gameManagerVM.resetGame()
                    gameManagerVM.start()
                }
                
            } label: {
                HStack {
                    // Play icon with bounce effect
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .symbolEffect(.bounce, value: isPressed)
                    
                    // Play Again text
                    ReusableText(text: "Play Again", font: .title, color: .white)
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.blue)
                .cornerRadius(30)
                .padding()
        }
    }
}

// Preview for testing
#Preview {
    QuizCompletedView(gameManagerVM: GameManagerVM(stateModel: StateModel()))
}
