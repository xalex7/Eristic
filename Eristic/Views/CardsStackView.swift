//
// CardsStackView.swift
// Eristic
//
//  Created by Fady A Eid on 11/27/23.
//

import SwiftUI

struct CardsStackView: View {
    @Environment(\.presentationMode) var presentationMode // reset
    @State var cards: [CardView]
    
    var body: some View {
        
        VStack {
            
            Button {
                // Shuffle the cards
                print("Shuffling cards")
                loadCards()
            } label: {
                VStack {
                    // Shuffle button
                    ReusableText(systemSymbol: "shuffle.circle.fill", text: "Shuffle", font: .title, color: .blue)
                    
                    // Card swiper view
                    CardSwiperView(cards: self.$cards , onCardSwiped: { swipeDirection, index in
                        
                        switch swipeDirection {
                        case .left:
                            // Card swiped Left direction
                            print("Card swiped Left direction at index \(index)")
                        case .right:
                            // Card swiped Right direction
                            print("Card swiped Right direction at index \(index)")
                        case .top:
                            // Card swiped Top direction
                            print("Card swiped Top direction at index \(index)")
                        case .bottom:
                            // Card swiped Bottom direction
                            print("Card swiped Bottom direction at index \(index)")
                        }
                        
                    }, onCardDragged: { swipeDirection, index, offset in
                        // Card dragged in a direction
                        print("Card dragged \(swipeDirection) direction at index \(index) with offset \(offset)")
                    })
                    .padding(.vertical, 20)
                }.padding()
                    .onAppear {
                        // Load cards on appearance
                        loadCards()
                    }
            }
        }.padding(.bottom, 70)
        .navigationTitle("Flash Fallacies")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    private func loadCards() {
        var newCards = [
            
            // Strawman
            CardView(index: 1, cardSymbol: "person.2.fill", title: "Strawman", argText: "We should invest more in improving public schools.", counText: "So, you're saying we should completely abandon private schools?"),
            CardView(index: 2, cardSymbol: "person.2.fill", title: "Strawman", argText: "We need to address climate change by reducing carbon emissions.", counText: "You want to shut down all industries and throw people out of jobs!"),
            CardView(index: 3, cardSymbol: "person.2.fill", title: "Strawman", argText: "Regulate firearms for public safety.", counText: "You're a socialist, want government control."),
            CardView(index: 4, cardSymbol: "person.2.fill", title: "Strawman", argText: "Reconsider military budget, focus on diplomacy.", counText: "You suggest leaving country defenseless."),
            CardView(index: 5, cardSymbol: "person.2.fill", title: "Strawman", argText: "Stricter food safety regulations to prevent health issues.", counText: "You want to ban fast food, enforce government-approved meals?"),
            
            // Ad Hominem
            CardView(index: 6, cardSymbol: "person.fill.viewfinder", title: "Ad Hominem", argText: "Abolish prisons; crime linked to social factors.", counText: "You're a bleeding-heart liberal, indifferent to crime victims."),
            CardView(index: 7, cardSymbol: "person.fill.viewfinder", title: "Ad Hominem", argText: "Ban assault weapons; they're the main cause of violence.", counText: "You're an ignorant anti-gunner, lacks knowledge about guns."),
            CardView(index: 8, cardSymbol: "person.fill.viewfinder", title: "Ad Hominem", argText: "Legalize all drugs; the war on drugs failed, leading to mass incarceration, violence, and corruption.", counText: "You're just a drug addict justifying your drug use."),
            CardView(index: 8, cardSymbol: "person.fill.viewfinder", title: "Ad Hominem", argText: "Open borders to immigrants; everyone deserves a better life.", counText: "You're a naive globalist ignoring national sovereignty."),
            
           // False Dilemma
            CardView(index: 10, cardSymbol: "circle.righthalf.filled.inverse", title: "False Dilemma", argText: "Love America despite social and political issues.", counText: "Love it as is or leave."),
            CardView(index: 11, cardSymbol: "circle.righthalf.filled.inverse", title: "False Dilemma", argText: "Consider myself a centrist who votes based on policies.", counText: "Either conservative or liberal!"),
            CardView(index: 12, cardSymbol: "circle.righthalf.filled.inverse", title: "False Dilemma", argText: "Any weekend plans?", counText: "Nothing good on TV, so I'll just get drunk."),
            CardView(index: 5, cardSymbol: "circle.righthalf.filled.inverse", title: "False Dilemma", argText: "What motivates supporting this candidate?", counText: "If he doesn't win, our economy will be devastated."),
            CardView(index: 13, cardSymbol: "circle.righthalf.filled.inverse", title: "False Dilemma", argText: "In advertisement", counText: "Use our beauty products or never look youthful."),
            CardView(index: 14, cardSymbol: "circle.righthalf.filled.inverse", title: "False Dilemma", argText: "Sustainable development balances economic growth and environmental responsibility.", counText: "Prioritize economic growth or focus solely on environmental conservation."),
            CardView(index: 15, cardSymbol: "circle.righthalf.filled.inverse", title: "False Dilemma", argText: "Promote informed vaccine choices, addressing concerns and ensuring transparency.", counText: "Either pro-vaccination without question or against all vaccines."),
            
            // Appeal to Ignorance
            CardView(index: 16, cardSymbol: "person.crop.circle.badge.xmark", title: "Appeal to Ignorance", argText: "Your perspectives on extraterrestrial life?", counText: "No evidence proving aliens don't exist, so they must."),
            CardView(index: 17, cardSymbol: "person.crop.circle.badge.xmark", title: "Appeal to Ignorance", argText: "Skeptical about psychics; predictions never proven accurate.", counText: "No one proved psychic powers aren't real, so they must be."),
            CardView(index: 18, cardSymbol: "person.crop.circle.badge.xmark", title: "Appeal to Ignorance", argText: "Scientists discussing time travel possibilities.", counText: "Can't prove time travel is impossible, so it must be achievable."),
            CardView(index: 19, cardSymbol: "person.crop.circle.badge.xmark", title: "Appeal to Ignorance", argText: "Saw a guy on TV claiming he saw Bigfoot.", counText: "Can't disprove Bigfoot's existence, so it's reasonable to believe."),
            CardView(index: 20, cardSymbol: "person.crop.circle.badge.xmark", title: "Appeal to Ignorance", argText: "How do you view allegations against this politician?", counText: "Since corruption charges aren't proven, the politician must be completely honest."),
            
            // Slippery Slope
            CardView(index: 21, cardSymbol: "wave.3.forward", title: "Slippery Slope", argText: "Allow students to use calculators for problem-solving.", counText: "Soon they won't know basic math without them."),
            CardView(index: 22, cardSymbol: "wave.3.forward", title: "Slippery Slope", argText: "Researchers suggest occasional remote work may increase productivity.", counText: "Soon, productivity will plummet, and the company will fail."),
            CardView(index: 23, cardSymbol: "wave.3.forward", title: "Slippery Slope", argText: "One person was a little late to the meeting; no big deal.", counText: "Soon everyone will be late, and meetings won't start on time."),
            CardView(index: 24, cardSymbol: "wave.3.forward", title: "Slippery Slope", argText: "Implement a flexible dress code for employee comfort.", counText: "This will lead to chaos, and people will wear anything."),
            CardView(index: 25, cardSymbol: "wave.3.forward", title: "Slippery Slope", argText: "Providing free samples encourages people to buy our product.", counText: "Giving free samples leads to everyone expecting free products, bankrupting businesses."),
            
            // Circular Reasoning
            CardView(index: 26, cardSymbol: "arrow.2.squarepath", title: "Circular Reasoning", argText: "How do you know global warming is a significant problem?", counText: "Scientists agree, and it's significant because they agree."),
            CardView(index: 27, cardSymbol: "arrow.2.squarepath", title: "Circular Reasoning", argText: "How do you know this book is a masterpiece?", counText: "Considered a classic because it's a masterpiece, and it's a masterpiece because it's considered a classic."),
            CardView(index: 28, cardSymbol: "arrow.2.squarepath", title: "Circular Reasoning", argText: "How can you trust this news source?", counText: "Reported by reputable sources, and they're reliable because they report accurately."),
            CardView(index: 29, cardSymbol: "arrow.2.squarepath", title: "Circular Reasoning", argText: "Why do you think this software is user-friendly?", counText: "User-friendly because the manual says so, and the manual is trustworthy as it's by the developer."),
            CardView(index: 30, cardSymbol: "arrow.2.squarepath", title: "Circular Reasoning", argText: "Why do you think this diet plan is effective?", counText: "Effective because testimonials say so, and testimonials are trustworthy as they follow the diet plan."),
            
            // Hasty Generalization
            CardView(index: 31, cardSymbol: "person.3.sequence.fill", title: "Hasty Generalization", argText: "Do you think all politicians are corrupt?", counText: "Yes, definitely. Heard about a few scandals, so all politicians must be corrupt."),
            CardView(index: 32, cardSymbol: "person.3.sequence.fill", title: "Hasty Generalization", argText: "What do you think about online classes?", counText: "Joined one online class, and it was boring. Online classes are a waste of time."),
            CardView(index: 33, cardSymbol: "person.3.sequence.fill", title: "Hasty Generalization", argText: "Did you attend the language learning meetup?", counText: "Went once, couldn't understand anything. Language meetups are a waste of time."),
            CardView(index: 34, cardSymbol: "person.3.sequence.fill", title: "Hasty Generalization", argText: "What's your opinion on the new movie?", counText: "Watched five minutes, seemed boring. The movie is probably not worth watching."),
            CardView(index: 35, cardSymbol: "person.3.sequence.fill", title: "Hasty Generalization", argText: "Did you visit the new restaurant downtown?", counText: "Yeah, went last week, service was terrible. That restaurant is awful."),
            
            // Appeal to Authority
            CardView(index: 36, cardSymbol: "bolt.fill", title: "Appeal to Authority", argText: "Why trust this diet plan?", counText: "Celebrity nutritionist backs it, so it must work."),
            CardView(index: 37, cardSymbol: "bolt.fill", title: "Appeal to Authority", argText: "Why support this political figure?", counText: "Famous actor endorsed them, making it a good choice."),
            CardView(index: 38, cardSymbol: "bolt.fill", title: "Appeal to Authority", argText: "Is this technology worth investing in?", counText: "Tech guru on social media recommended it, making it a smart investment."),
            CardView(index: 39, cardSymbol: "bolt.fill", title: "Appeal to Authority", argText: "Is this product effective?", counText: "Top athlete endorses it, ensuring enhanced performance."),
            CardView(index: 40, cardSymbol: "bolt.fill", title: "Appeal to Authority", argText: "Is this financial advice reliable?", counText: "Billionaire entrepreneur recommended it, so it's likely sound."),
            
            // Red Herring
            CardView(index: 41, cardSymbol: "person.fill.questionmark", title: "Red Herring", argText: "Did you forget to do the dishes?", counText: "Don't appreciate how hard I work. Had a long day."),
            CardView(index: 42, cardSymbol: "person.fill.questionmark", title: "Red Herring", argText: "Have you been drinking alcohol at the party?", counText: "Spent the whole day organizing. Can't you see my effort?"),
            CardView(index: 43, cardSymbol: "person.fill.questionmark", title: "Red Herring", argText: "Did you finish your project?", counText: "Computer crashed. Dealing with technical issues is frustrating."),
            CardView(index: 44, cardSymbol: "person.fill.questionmark", title: "Red Herring", argText: "Why didn't you submit the report on time?", counText: "Doctor's appointment, kids from school. Work isn't my only priority."),
            CardView(index: 45, cardSymbol: "person.fill.questionmark", title: "Red Herring", argText: "Did you cheat on the test?", counText: "Struggling with the subject. Accusing me won't help."),
            
            // Equivocation
            CardView(index: 46, cardSymbol: "arrow.3.trianglepath", title: "Equivocation", argText: "Did you attend the full meeting?", counText: "Yes, I attended. Joined for the first few minutes, then left early."),
            CardView(index: 47, cardSymbol: "arrow.3.trianglepath", title: "Equivocation", argText: "Did you finish the report on time?", counText: "Yes, it's finished. Introduction and conclusion are done, but the body needs more work."),
            CardView(index: 48, cardSymbol: "arrow.3.trianglepath", title: "Equivocation", argText: "Did you read the entire article?", counText: "Yes, I read it. Abstract and conclusion. That's the essence, right?"),
            CardView(index: 49, cardSymbol: "arrow.3.trianglepath", title: "Equivocation", argText: "Did you return the borrowed book?", counText: "Yes, I returned it. Returned it to the shelf, not to the owner."),
            CardView(index: 50, cardSymbol: "arrow.3.trianglepath", title: "Equivocation", argText: "Did you resolve the software issue?", counText: "Yes, it's resolved. Restarted the computer, but the issue might happen again."),
            
            // Appeal to Emotion
            CardView(index: 51, cardSymbol: "heart.fill", title: "Appeal to Emotion", argText: "Why support this environmental policy?", counText: "Think about the suffering animals. We must do it for them."),
            CardView(index: 52, cardSymbol: "heart.fill", title: "Appeal to Emotion", argText: "Argument for stricter gun control?", counText: "Consider the emotional toll of gun violence on families. Stricter control saves lives and prevents suffering."),
            CardView(index: 53, cardSymbol: "heart.fill", title: "Appeal to Emotion", argText: "Address mental health in workplace policies?", counText: "Imagine the relief employees would feel if we prioritize mental health. Essential for their overall well-being."),
            CardView(index: 54, cardSymbol: "heart.fill", title: "Appeal to Emotion", argText: "Why donate to this specific charity?", counText: "Imagine the children's faces lighting up when they receive our help."),
            CardView(index: 55, cardSymbol: "heart.fill", title: "Appeal to Emotion", argText: "Why invest in renewable energy?", counText: "Think about a cleaner planet for future generations. Investing in renewables is crucial for their well-being."),
            
            // Tu Quoque
            CardView(index: 56, cardSymbol: "person.fill.and.arrow.left.and.arrow.right", title: "Tu Quoque", argText: "You shouldn't have skipped class. It's important to attend lectures.", counText: "Well, you've skipped class before too, so why are you telling me now?"),
            CardView(index: 57, cardSymbol: "person.fill.and.arrow.left.and.arrow.right", title: "Tu Quoque", argText: "Don't drink and drive. It's dangerous.", counText: "I've seen you drive after having a few drinks. Why the hypocrisy?"),
            CardView(index: 58, cardSymbol: "person.fill.and.arrow.left.and.arrow.right", title: "Tu Quoque", argText: "Respect other people's privacy.", counText: "I've seen you go through someone's phone. Why are you being a hypocrite?"),
            CardView(index: 59, cardSymbol: "person.fill.and.arrow.left.and.arrow.right", title: "Tu Quoque", argText: "Peer review ensures quality.", counText: "You published without rigorous review. Why advocate for it now?"),
            CardView(index: 60, cardSymbol: "person.fill.and.arrow.left.and.arrow.right", title: "Tu Quoque", argText: "Scientific integrity is paramount in our field.", counText: "I've heard rumors about your involvement in unethical practices. Why should I take your moral stand seriously?"),
        ]
        // Shuffle the cards
        newCards.shuffle()
        cards = newCards
    }
}

#Preview {
    CardsStackView(cards: [])
}

