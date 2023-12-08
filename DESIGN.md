# MVVM (Model–View–ViewModel) in SwiftUI

## Overview

MVVM is an architectural design pattern that separates the application into three interconnected components: Model, View, and ViewModel. This pattern enhances the maintainability, scalability, and testability of an application.

### Model:
- Represents the data and business logic of the application.
- Manages the data, business rules, and logic for the application.
- Should be independent of the user interface.

### View:
- Represents the user interface (UI) of the application.
- Displays information to the user and captures user interactions.
- Doesn't contain any application logic but is responsible for updating the UI based on changes in the ViewModel.

### ViewModel:
- Acts as an intermediary between the Model and the View.
- Exposes data and commands to be displayed in the View.
- Contains the application logic, transforms data for the View, and handles user input.
- Keeps the View and Model separate, ensuring a clean separation of concerns.

## MVVM in SwiftUI: How it is Used

In SwiftUI, MVVM is a commonly adopted pattern due to its compatibility with the framework's declarative and reactive nature.

### Model (Data):
- SwiftUI Views are often bound to a ViewModel, which is responsible for managing the data.
- Data can come from various sources such as databases, APIs, or other services.

### View (User Interface):
- SwiftUI Views are responsible for presenting the UI to the user.
- Views declare their structure and appearance based on the data provided by the ViewModel.
- The View observes changes in the ViewModel and automatically updates when the data changes.

### ViewModel (Intermediary):
- The ViewModel exposes properties that represent the state of the UI.
- Contains logic to transform and manipulate data for the View.
- Listens for user interactions and updates the Model accordingly.

# Eristic Implemntation:

The topic of informal logical fallacies has always been an intersting topic for me. Although it is very common in lives in everything around us from advertisment to politics to academic debates ..etc. Yet it is still complicated to identifity each informal fallacy in argument.
The problem that I tried to solve through Eristic 
