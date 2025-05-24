# Collage-me: Animal Management App

A SwiftUI and SwiftData demo application for managing animal categories and their details. This app demonstrates modern iOS development practices using SwiftUI, SwiftData, and the latest iOS features.

## Features

- **Animal Categories Management**
  - View list of animal categories (Mammals, Birds, Fish, etc.)
  - Add new animal categories
  - Reload sample data

- **Animal Management**
  - Add new animals with details
  - Edit existing animal information
  - Delete animals
  - View animal details

- **Animal Details**
  - Name
  - Category
  - Diet type (Carnivorous, Herbivorous, Omnivorous)

## Technical Details

### Architecture
- Built with SwiftUI for the user interface
- Uses SwiftData for persistence
- Follows MVVM architecture pattern
- Implements modern iOS navigation patterns

### Key Components

- **Models**
  - `Animal`: Represents an animal with properties for name, diet, and category
  - `AnimalCategory`: Represents animal categories with a unique name and associated animals

- **Views**
  - `ThreeColumnContentView`: Main navigation structure
  - `AnimalCategoryListView`: Displays and manages animal categories
  - `AnimalListView`: Shows animals within a selected category
  - `AnimalDetailView`: Displays detailed information about an animal
  - `AnimalEditor`: Form for adding and editing animals

### Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Getting Started

1. Clone the repository
2. Open the project in Xcode
3. Build and run the application

## Sample Data

The app comes with sample data including:
- Animal Categories: Mammal, Bird, Fish, Amphibian, Reptile, Invertebrate
- Sample Animals: Dog, Cat, Kangaroo, Gibbon, Sparrow, Newt

## License

This project is available for educational purposes.

## Author

Created by Mahmoud Aoata 