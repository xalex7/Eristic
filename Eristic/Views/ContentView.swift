//
//  ContentView.swift
//  Eristic
//
//  Created by Fady A Eid on 11/20/23.
//

import SwiftUI

// MARK: - Environment Values Extension
extension EnvironmentValues {
    var stateModel: StateModel {
        get { self[StateModelKey.self] }
        set { self[StateModelKey.self] = newValue }
    }
}

// MARK: - StateModel Key
private struct StateModelKey: EnvironmentKey {
    static var defaultValue = StateModel()
}

// MARK: - ContentView
struct ContentView: View {
    // MARK: Properties
    @State private var username = ""
    @State private var password = ""
    @State private var highestScore = 0
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    @State private var logInPressed = false
    
    // MARK: Body
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    // Username TextField
                    TextField("Username", text: $username)
                        .disableAutocorrection(true)  // Disable autocorrection
                        .autocapitalization(.none)
                        .font(.title2)// Disable autocapitalization
                    Divider()
                    
                    // Password SecureField
                    SecureField("Passcode", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .keyboardType(.numberPad)
                        .font(.title2)
                    // Restrict to numbers and show numeric keypad
                    Divider()
                }.padding(.bottom, 50)
                
                VStack {
                    // NavigationLink to FallaciesView
                    NavigationLink(destination: FallaciesView(), isActive: $isLoggedIn) { EmptyView() }
                    
                    VStack {
                        // Log in Button
                        Button(action: {
                            if username.isEmpty || password.isEmpty {
                                showAlert(message: "No entry, no log in")
                            } else if AuthenticationManager.shared.loginUser(username, password) {
                                logInPressed.toggle()
                                
                                // Successfully logged in, wait for 1 second before navigating
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    // Navigate to FallaciesView
                                    print("Successfully logged in!")
                                    isLoggedIn = true
                                }
                                // stateModel.currentUserName = username
                            } else {
                                showAlert(message: "Incorrect credentials")
                                print("Login failed. Incorrect credentials.")
                            }
                        }) {
                            // Log in Button UI
                            Text(logInPressed ? "Welcome" : "Log in")
                                .font(.title2)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .foregroundColor(Color.white)
                                .background(logInPressed ? Color.green : Color.blue) // Change color based on isPressed
                                .cornerRadius(10)
                        }
                    }
                    
                    // Register Button
                    Button(action: {
                        if username.isEmpty || password.isEmpty {
                            showAlert(message: "It's a fallacy to try to register without entry")
                        } else if AuthenticationManager.shared.registerUser(UserModel(username: username, password: password, highestScore: highestScore)) {
                            
                            isLoggedIn = AuthenticationManager.shared.loginUser(username, password)
                            if isLoggedIn {
                                print("Successfully registered and logged in!")
                            } else {
                                showAlert(message: "Registration successful, but login failed.")
                            }
                        } else {
                            showAlert(message: "Username already exists.")
                        }
                    }) {
                        // Register Button UI
                        Text("Register")
                            .font(.title2)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding([.top, .bottom])
            }
            .padding()
            .alert(isPresented: $isShowingAlert) {
                // Alert with brain emoji
                Alert(title: Text("🧠"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: ReusableText(systemSymbol: "brain.fill", text: "Think Critical", font: .largeTitle, color: .blue))
        }
        .navigationBarBackButtonHidden(true) // Hide the back button globally
    }
    
    // MARK: Show Alert Function
    private func showAlert(message: String) {
        alertMessage = message
        isShowingAlert = true
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
