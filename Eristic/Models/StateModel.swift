//
//  StateModel.swift
//  Eristic
//
//  Created by Fady A Eid on 11/23/23.
//

import Foundation
import Observation

// A class representing the state model of the application
final class StateModel: ObservableObject {
    // Current user's name
    let currentUserName: String
    
    // Published property for the current user's high score
    @Published var currentUserHighScore: Int
    
    // Initialize the state model
    init() {
        // Get the current user's name from the authentication manager
        currentUserName = AuthenticationManager.shared.getCurrentUsername() ?? ""
        
        // Initialize the user's high score from the authenticated user's data
        currentUserHighScore = AuthenticationManager.shared.currentLoggedInUser?.highestScore ?? 0
    }
}





