//
//  User.swift
//  Eristic
//
//  Created by Fady A Eid on 11/20/23.
//

import Foundation

// User Model
struct UserModel: Codable, Equatable {
    // Properties
    let username: String
    let password: String
    var highestScore: Int = 0
}
