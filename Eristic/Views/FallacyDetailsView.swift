

import SwiftUI

//var list = FallaciesList.fallacies

struct FallacyDetailsView: View {
    let exampleFallacy: Fallacy /* = FallaciesList.fallacies[0]*/
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Definition").sectionHeader()) {
                    Text(exampleFallacy.definition).sectionContent()
                }
                Section(header: Text("Example").sectionHeader()) {
                    
                    Text(exampleFallacy.examples).sectionContent()
                }
                Section(header: Text("Why It is a Fallacy").sectionHeader()) {
                    Text(exampleFallacy.whyFallacy).sectionContent()
                }
                Section(header: Text("How to Identify").sectionHeader()) {
                    Text(exampleFallacy.tipsToIdentify).sectionContent()
                }
                Section(header: Text("How to Avoid").sectionHeader()) {
                    
                    Text(exampleFallacy.howToAvoid).sectionContent()
                }
                Section(header: Text("Consequences").sectionHeader()) {
                    Text(exampleFallacy.consequences).sectionContent()
                }
                Section(header: Text("Countering").sectionHeader()) {
                    Text(exampleFallacy.counteringTips).sectionContent()
                }
            }
            .listStyle(.grouped)
        }
        .navigationTitle(exampleFallacy.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

// Helper extensions for consistent styling
extension Text {
    func sectionHeader() -> Text {
        self.font(.headline)
            .foregroundColor(.blue)
    }
    
    func sectionContent() -> Text {
        self.font(.body)
    }
}



#Preview {
    FallacyDetailsView(exampleFallacy: FallaciesList.fallacies[0])
}
