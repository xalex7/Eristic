//
//  SwipeView.swift
//  Eristic
//
//  Created by Fady A Eid on 11/27/23.
//

import SwiftUI

// Enum to represent different swipe directions
enum SwipeDirection {
    case left, right, top, bottom
}

// Main view for the card swiper
public struct CardSwiperView<Content: View>: View {
    @Binding var cards: [Content] // Binding for the array of cards
    
    var onCardSwiped: ((SwipeDirection, Int) -> Void)? // Callback for card swiping
    var onCardDragged: ((SwipeDirection, Int, CGSize) -> Void)? // Callback for card dragging
    var initialOffsetY: CGFloat = 5 // Initial Y offset for cards
    var initialRotationAngle: Double = 0.5 // Initial rotation angle for cards
    
    // Initializer for the card swiper
    init(
        cards: Binding<[Content]>,
        onCardSwiped: ((SwipeDirection, Int) -> Void)? = nil,
        onCardDragged: ((SwipeDirection, Int, CGSize) -> Void)? = nil,
        initialOffsetY: CGFloat = 5,
        initialRotationAngle: Double = 0.5
    ) {
        self._cards = cards
        self.onCardSwiped = onCardSwiped
        self.onCardDragged = onCardDragged
        self.initialOffsetY = initialOffsetY
        self.initialRotationAngle = initialRotationAngle
    }
    
    // Body of the card swiper view
    public var body: some View {
        ZStack {
            // Loop through the card indices and create CardView for each
            ForEach(cards.indices, id: \.self) { index in
                // Create CardView with specified parameters
                CardView(
                    index: index,
                    onCardSwiped: { swipeDirection in
                        onCardSwiped?(swipeDirection, index)
                    },
                    onCardDragged: { direction, index, offset in
                        onCardDragged?(direction, index, offset)
                    },
                    content: {
                        cards[index]
                    },
                    initialOffsetY: initialOffsetY,
                    initialRotationAngle: initialRotationAngle,
                    zIndex: Double(cards.count - index)
                )
                .id(UUID()) // Set a unique identifier
            }
        }
    }
    
    // Nested CardView to represent each individual card
    private struct CardView<Content: View>: View {
        var index: Int // Index of the card
        var onCardSwiped: ((SwipeDirection) -> Void)? // Callback for card swiping
        var onCardDragged: ((SwipeDirection, Int, CGSize) -> Void)? // Callback for card dragging
        var content: () -> Content // Content of the card
        var initialOffsetY: CGFloat // Initial Y offset for cards
        var initialRotationAngle: Double // Initial rotation angle for cards
        var zIndex: Double // Z index for layering
        
        @State private var offset = CGSize.zero // Offset for card position
        @State private var overlayColor: Color = .clear // Overlay color for visual effect
        @State private var isRemoved = false // Flag to indicate if the card is removed
        @State private var activeCardIndex: Int? // Index of the active card
        
        // Body of the individual card view
        var body: some View {
            ZStack {
                // Display the content of the card with specified styling
                content()
                    .frame(width: 320, height: 450)
                    .offset(x: offset.width * 1, y: offset.height * 0.4)
                    .rotationEffect(.degrees(Double(offset.width / 40)))
                    .zIndex(zIndex)
                
                // Overlay rectangle for visual effect when swiped
                Rectangle()
                    .foregroundColor(overlayColor)
                    .opacity(isRemoved ? 0 : (activeCardIndex == index ? 1 : 0))
                    .frame(width: 320, height: 450)
                    .cornerRadius(10)
                    .blendMode(.overlay)
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation // Update offset based on gesture
                        activeCardIndex = index // Set the active card index
                        withAnimation {
                            handleCardDragging(offset) // Handle card dragging with animation
                        }
                    }
                    .onEnded { gesture in
                        withAnimation {
                            handleSwipe(offsetWidth: offset.width, offsetHeight: offset.height) // Handle card swiping with animation
                        }
                    }
            )
            .opacity(isRemoved ? 0 : 1) // Set opacity based on removal status
        }
        
        // Function to handle card dragging and trigger the callback
        func handleCardDragging(_ offset: CGSize) {
            var swipeDirection: SwipeDirection = .left
            
            switch (offset.width, offset.height) {
            case (-500...(-150), _):
                swipeDirection = .left
            case (150...500, _):
                swipeDirection = .right
            case (_, -500...(-150)):
                swipeDirection = .top
            case (_, 150...500):
                swipeDirection = .bottom
            default:
                break
            }
            
            onCardDragged?(swipeDirection, index, offset)
        }
        
        // Function to handle card swiping and trigger the callback
        func handleSwipe(offsetWidth: CGFloat, offsetHeight: CGFloat) {
            var swipeDirection: SwipeDirection = .left
            
            switch (offsetWidth, offsetHeight) {
            case (-500...(-150), _):
                swipeDirection = .left
                offset = CGSize(width: -500, height: 0)
                isRemoved = true
                onCardSwiped?(swipeDirection)
            case (150...500, _):
                swipeDirection = .right
                offset = CGSize(width: 500, height: 0)
                isRemoved = true
                onCardSwiped?(swipeDirection)
            case (_, -500...(-150)):
                swipeDirection = .top
                offset = CGSize(width: 0, height: -500)
                isRemoved = true
                onCardSwiped?(swipeDirection)
            case (_, 150...500):
                swipeDirection = .bottom
                offset = CGSize(width: 0, height: 500)
                isRemoved = true
                onCardSwiped?(swipeDirection)
            default:
                offset = .zero
                overlayColor = .clear
            }
        }
    }
}
