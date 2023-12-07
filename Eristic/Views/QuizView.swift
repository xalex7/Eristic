//
//  QuizView.swift
//  Eristic
//
//  Created by Fady A Eid on 11/27/23.
//

import SwiftUI

struct QuizView: View {
    // StateObject for managing game state
    @StateObject var gameManagerVM: GameManagerVM
    
    // Main view structure
    var body: some View {
        ZStack {
            // Check if the quiz is completed
            if (gameManagerVM.model.quizCompleted) {
                // Show QuizCompletedView if the quiz is completed
                QuizCompletedView(gameManagerVM: gameManagerVM)
            } else {
                VStack {
                    // Display the current score
                    HStack {
                        // Score icon
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .symbolEffect(.bounce, value: gameManagerVM.score)
                        
                        // Score text
                        ReusableText(text: "Score: \(gameManagerVM.score)", font: .title2, color: .blue)
                    }
                    
                    // Display the current quiz question
                    ReusableText(text: gameManagerVM.model.quizModel.question, font: .title2, color: .black)
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding()
                        .minimumScaleFactor(0.7)
                    Spacer()
                    
                    // Timer circle for tracking quiz progress
                    ZStack {
                        // Background circle
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                        
                        // Animated progress circle
                        Circle()
                            .trim(from: 0.0, to: min(CGFloat((Double(gameManagerVM.progress) * 60.0)/60.0), 1.0))
                            .stroke(Color.blue,
                                    style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                            .animation(Animation.linear(duration: 60.0), value: gameManagerVM.progress)
                        
                        // Display remaining time
                        VStack {
                            ReusableText(text: String(gameManagerVM.progress), font: .title, color: .blue)
                        }
                    }.frame(width: 150, height: 150)
                    
                    Spacer()
                    
                    // Display options grid
                    OptionsGridView(gameManagerVM: gameManagerVM)
                }
            }
        }
        .navigationTitle("Critical Quiz")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            // Start the quiz on view appear
            gameManagerVM.start()
        }
        .onDisappear() {
            // Reset the game on view disappear
            gameManagerVM.resetGame()
        }
    }
}

// Preview for testing
#Preview {
    QuizView(gameManagerVM: GameManagerVM(stateModel: StateModel()))
}
