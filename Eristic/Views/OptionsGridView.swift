//
//  OptionsGridView.swift
//  Eristic
//
//  Created by Fady A Eid on 11/26/23.
//

import Foundation
import SwiftUI

// View displaying the grid of quiz options
struct OptionsGridView: View {
    // ObservedObject to observe changes in game state
    @ObservedObject var gameManagerVM: GameManagerVM
    // Grid layout columns
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 0), count: 2)
    
    // Body of the view
    var body: some View {
        // LazyVGrid for efficient grid layout
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(gameManagerVM.model.quizModel.optionsList) { quizOption in
                // OptionCardView for each quiz option
                OptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        // Verify answer on tap
                        gameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
    }
}

// View representing the card for each quiz option
struct OptionCardView : View {
    // QuizOption instance for the option
    var quizOption: QuizOption
    
    // Body of the view
    var body: some View {
        VStack {
            // Checkmark or Xmark status image if option is matched or not
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "checkmark")
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
                OptionStatusImageView(imageName: "xmark")
            } else {
                // Regular OptionView if not matched or selected
                OptionView(quizOption: quizOption)
            }
        }.frame(width: 150, height: 150)
        .background(setBackgroundColor())
        .cornerRadius(10)
    }
    
    // Set background color based on option status
    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.blue
        }
    }
}

// View representing the content of each quiz option
struct OptionView: View {
    // QuizOption instance for the option
    var quizOption: QuizOption
    
    // Body of the view
    var body: some View {
        VStack {
            // Circle with options
            Text(quizOption.optionId)
                .font(.system(size: 35, weight: .regular))
                .frame(width: 50, height: 50)
                .background(quizOption.color.opacity(1))
                .foregroundColor(.blue)
                .cornerRadius(25)
            
            // Options square containing the circle
            Text(quizOption.option)
                .frame(width: 150, height: 38)
                .truncationMode(.tail)
                .font(.subheadline)
        }
    }
}

// View representing the status image for matched or unmatched options
struct OptionStatusImageView: View {
    // Image name for the status (checkmark or xmark)
    var imageName: String
    
    // Body of the view
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}

// Preview for testing OptionsGridView
#Preview {
    OptionsGridView(gameManagerVM: GameManagerVM(stateModel: StateModel()))
}
