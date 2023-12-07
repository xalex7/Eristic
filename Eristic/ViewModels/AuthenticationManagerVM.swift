//
//  AuthenticationManager.swift
//  Eristic
//
//  Created by Fady A Eid on 11/25/23.
//

import Foundation

class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    // MARK: - Properties
    let userDefaults = UserDefaults.standard
    let usersKey = "registeredUsers"
    var currentLoggedInUser: UserModel?
    private var users: [UserModel]?
    
    private init() { }
    
    // MARK: - User Registration
    
    func registerUser(_ user: UserModel) -> Bool {
        var registeredUsers = getUsers()
        
        // Check for empty username or password
        guard !user.username.isEmpty && !user.password.isEmpty else {
            return false
        }
        
        // Check if the user already exists
        guard !registeredUsers.contains(user) else {
            return false
        }
        
        registeredUsers.append(user)
        saveUsers(registeredUsers)
        currentLoggedInUser = user

        return true
    }
    
    // MARK: - User Login
    
    func loginUser(_ username: String, _ password: String) -> Bool {
        let registeredUsers = getUsers()
        
        // Check for empty username or password
        guard !username.isEmpty && !password.isEmpty else {
            return false
        }
        
        // Check if the credentials are correct
        guard registeredUsers.contains(where: { $0.username == username && $0.password == password }) else {
            return false
        }
        
        currentLoggedInUser = registeredUsers.first(where: { $0.username == username && $0.password == password })
        users = registeredUsers
        // Successful login
        return true
    }
    
    func getCurrentUsername() -> String? {
        // Use guard to ensure there's a logged-in user
        guard let loggedInUser = currentLoggedInUser else {
            return nil
        }
        
        return loggedInUser.username
    }
    
    // MARK: - User Logout
    
    func logoutUser() {
        currentLoggedInUser = nil
    }
    
    func saveHighScore(_ score: Int) {
        currentLoggedInUser?.highestScore = score
        if var users, let index = users.firstIndex(where: { $0.username == currentLoggedInUser?.username && $0.password == currentLoggedInUser?.password }) {
            users[index].highestScore = score
            self.users = users
            saveUsers(users)
        }
    }
    
    // MARK: - Private Helper Methods
    
    private func getUsers() -> [UserModel] {
        guard let userData = userDefaults.data(forKey: usersKey) else { return [] }
        do {
            let users = try JSONDecoder().decode([UserModel].self, from: userData)
            return users
        } catch {
            return []
        }
    }
    
    private func saveUsers(_ users: [UserModel]) {
        do {
            let userData = try JSONEncoder().encode(users)
            userDefaults.set(userData, forKey: usersKey)
        } catch {
            // Log the error
            print("Error encoding users: \(error.localizedDescription)")
            
            // Return without saving anything
            return
        }
    }
}


