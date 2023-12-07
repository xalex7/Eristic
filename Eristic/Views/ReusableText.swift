//
//  ReusableText.swift
//  Eristic
//
//  Created by Fady A Eid on 11/20/23.
//

import Foundation
import SwiftUI

// ReusableText view for displaying text with optional system symbol
struct ReusableText: View {
    var systemSymbol: String?
    var text: String // Text content
    var font: Font // Font for the text
    var color: Color // Color for the text
    
    // Body of the view
    var body: some View {
        HStack {
            // Display system symbol if provided
            if let symbol = systemSymbol {
                Image(systemName: symbol)
                    .foregroundColor(color)
                    .font(font)
            }
            
            // Display main text
            Text("\(text)")
                .font(font)
                .foregroundColor(color)
                .multilineTextAlignment(.center)
        }
    }
}
