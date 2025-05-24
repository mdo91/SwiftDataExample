//
//  AnimalCategoryListView.swift
//  Collage-me
//
//  Created by Mahmoud Aoata on 23/05/2025.
//

import SwiftUI
import SwiftData

struct AnimalCategoryListView: View {
    
    @Environment(NavigationContext.self) private var navigationContext
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \AnimalCategory.name) private var animalCategories: [AnimalCategory]
    
    @State private var isReloadPresented = false
    
    var body: some View {
        @Bindable var navigationContext = navigationContext
        List(selection: $navigationContext.selectedAnimalCategoryName) {
            #if os(macOS)
            Section(navigationContext.sidebarTitle) {
                ListCategories(animalCategories: animalCategories)
            }
            #else
            ListCategories(animalCategories: animalCategories)
            #endif
        }
        .alert("Reload sample data?", isPresented: $isReloadPresented) {
            Button("Yes, reload sample data", role: .destructive) {
                reloadSampleData()
            }
        } message: {
            Text("Reloading the sample data deletes all changes to the current data.")
        }
        .toolbar {
            Button {
                isReloadPresented = true
            } label: {
                Label("", systemImage: "arrow.clockwise")
                    .help("Reload sample data")
            }
        }
        .task {
            if animalCategories.isEmpty {
                AnimalCategory.insertSampleData(modelContext: modelContext)
            }
        }
    }
    
    @MainActor
    private func reloadSampleData() {
        navigationContext.selectedAnimal = nil
        navigationContext.selectedAnimalCategoryName = nil
        AnimalCategory.reloadSampleData(modelContext: modelContext)
    }
}

private struct ListCategories: View {
    var animalCategories: [AnimalCategory]
    var body: some View {
        
        ForEach(animalCategories) { animalCategory in
            NavigationLink(animalCategory.name, value: animalCategory.name)
            
        }
    }
}

#Preview("AnimalCategoryListView") {
    ModelContainerPreview(ModelContainer.sample) {
        NavigationStack {
            AnimalCategoryListView()
        }.environment(NavigationContext())
    }
}

#Preview("List Categories") {
    ModelContainerPreview(ModelContainer.sample) {
        NavigationStack {
            List {
                ListCategories(animalCategories: [.amphibian, .bird])
            }
        }
        .environment(NavigationContext())
    }
}
