//
//  CardView.swift
//  Eristic
//
//  Created by Fady A Eid on 11/27/23.
//

import SwiftUI

struct CardView: View {
    // Card properties
    let index: Int
    let cardSymbol: String
    let title: String
    let argument: String = ""
    let argText: String
    let counterArgument: String = "Fallacy Response .."
    let counText: String
    
    var body: some View {
        
        // Rounded rectangle for card
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .overlay(
                // Card content
                VStack(spacing: 30) {
                    // Lightning bolt icon
                    Image(systemName: "\(cardSymbol)")
                        .font(.largeTitle)
                        .foregroundStyle(.blue, .red, .gray)
                        .padding()
                    
                    // Card title
                    ReusableText(text: "\(title)", font: .title, color: .red)
            
                    // Argument section
                    VStack {
                        ReusableText(systemSymbol: "bubble.fill",text: "\(argument)", font: .title, color: .blue)
                        ReusableText(text: "\(argText)", font: .title3, color: .black)
                    }.minimumScaleFactor(0.5)
                    
                    // Counterargument section
                    VStack {
                        ReusableText(systemSymbol: "exclamationmark.bubble.fill",text: "\(counterArgument)", font: .title3, color: .red)
                        ReusableText(text: "\(counText)", font: .title2, color: .black)
                            .minimumScaleFactor(0.5)
                    }.minimumScaleFactor(0.5)
                }
                .padding()
            )
            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 3) // Card shadow
    }
}

#Preview {
    // Example card
    CardView(index: 0, cardSymbol: "bolt.fill", title: "Ad Hominem", argText: "Climate change is a serious issue!", counText: "You're not qualified to talk about climate change; you dropped out of college." )
}
