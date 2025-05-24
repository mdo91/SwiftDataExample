//
//  AnimalEditor.swift
//  Animal
//
//  Created by Mahmoud Aoata on 21/05/2025.
//

import SwiftUI
import SwiftData

struct AnimalEditor: View {
    let animal: Animal?
    
    private var editorTitle: String {
        animal == nil ? "Add Animal" : "Edit Animal"
    }
    @State private var name = ""
    @State private var selectedDiet = Animal.Diet.herbivorous
    @State private var selectedCategory: AnimalCategory?
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \AnimalCategory.name) private var categories: [AnimalCategory]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Category", selection: $selectedCategory) {
                    Text("Select a category").tag(nil as AnimalCategory?)
                    
                    ForEach(categories) { category in
                        Text(category.name).tag(category as AnimalCategory?)
                    }
                }
                
                Picker("Diet", selection: $selectedDiet) {
                    ForEach(Animal.Diet.allCases, id: \.self) { diet in
                        Text(diet.rawValue).tag(diet)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(editorTitle)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            save()
                            dismiss()
                        }

                    }
                    // Require a category to save the changes
                    .disabled($selectedCategory.wrappedValue == nil)
                }

                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let animal {
                    name = animal.name
                    selectedDiet = animal.diet
                    selectedCategory = animal.category
                }
            }
            #if os(macOS)
            .padding()
            #endif
        }
    }
    
    private func save() {
        do {
            if let animal {
                // Edit animal
                animal.name = name
                animal.diet = selectedDiet
                animal.category = selectedCategory
                
            } else {
                // Add Animal
                let newAnimal = Animal(name: name, diet: selectedDiet)
                newAnimal.category = selectedCategory
                modelContext.insert(newAnimal)
                
                try modelContext.save()
            }
        } catch {
            print("Error saving \(error.localizedDescription)")
            // handle alert
        }
    }
}

#Preview("Add animal") {
    ModelContainerPreview(ModelContainer.sample) {
        AnimalEditor(animal: nil)
    }
}
#Preview("Edit animal") {
    ModelContainerPreview(ModelContainer.sample) {
        AnimalEditor(animal: .kangaroo)
    }
}
