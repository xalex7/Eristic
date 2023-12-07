//
//  CoverFlowMenu.swift
//  Eristic
//
//  Created by Fady A Eid on 11/20/23.
//

import SwiftUI

struct CoverFlowMenu: View {
    let menuItems = [
        CoverFlowMenuItem(id: 1, icon: "person.2.fill", title: "Strawman"),
        CoverFlowMenuItem(id: 2, icon: "person.fill.viewfinder", title: "Ad Hominem"),
        CoverFlowMenuItem(id: 3, icon: "circle.righthalf.filled.inverse", title: "False Dilemma"),
        CoverFlowMenuItem(id: 4, icon: "person.crop.circle.badge.xmark", title: "Appeal to Ignorance"),
        CoverFlowMenuItem(id: 5, icon: "wave.3.forward", title: "Slippery Slope"),
        CoverFlowMenuItem(id: 6, icon: "arrow.2.squarepath", title: "Circular Reasoning"),
        CoverFlowMenuItem(id: 7, icon: "person.3.sequence.fill", title: "Hasty Generalization"),
        CoverFlowMenuItem(id: 8, icon: "bolt.fill", title: "Appeal to Authority"),
        CoverFlowMenuItem(id: 9, icon: "person.fill.questionmark", title: "Red Herring"),
        CoverFlowMenuItem(id: 10, icon: "arrow.3.trianglepath", title: "Equivocation"),
        CoverFlowMenuItem(id: 11, icon: "heart.fill", title: "Appeal to Emotion"),
        CoverFlowMenuItem(id: 12, icon: "person.fill.and.arrow.left.and.arrow.right", title: "Tu Quoque")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 10) {
                ForEach(menuItems) { item in
                    NavigationLink {
                        let detailedFallacy = FallaciesList.fallacies.first(where: {$0.id == item.id})
                        FallacyDetailsView(exampleFallacy: detailedFallacy!)
                    } label: {
                        CoverFlowItemView(item: item)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CoverFlowMenu()
}
