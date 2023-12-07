//
//  QuizModel.swift
//  Eristic
//
//  Created by Fady A Eid on 11/23/23.
//

import Foundation
import SwiftUI

// Quiz structure to manage quiz state
struct Quiz {
    var currentQuestionIndex: Int // Index of the current question
    var quizModel: QuizModel // Model containing question, answer, and options
    var quizCompleted: Bool = false // Flag indicating if the quiz is completed
}

// Model representing a quiz question
struct QuizModel {
    var question: String // The question text
    var answer: String // The correct answer
    var optionsList: [QuizOption] // List of options for the question
}

// Option structure for a quiz question
struct QuizOption : Identifiable {
    var id: Int // Identifier for the option
    var optionId: String // Unique identifier for the option
    var option: String // Option text
    var color: Color = .white // Color associated with the option
    var isSelected : Bool = false // Flag indicating if the option is selected
    var isMatched : Bool = false // Flag indicating if the option is matched to the correct answer
}


