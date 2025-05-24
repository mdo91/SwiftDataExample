//
//  ThreeColumnContentView.swift
//  Collage-me
//
//  Created by Mahmoud Aoata on 21/05/2025.
//

import SwiftUI
import SwiftData

struct ThreeColumnContentView: View {
    @Environment(NavigationContext.self) private var navigationContext
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        @Bindable var navigationContext = navigationContext
        
        NavigationSplitView(columnVisibility: $navigationContext.columnVisiblity) {
            // AnimalCategoryListView
            AnimalCategoryListView()
                .navigationTitle(navigationContext.sidebarTitle)
        } content: {
            AnimalListView(animalCategoryName: navigationContext.selectedAnimalCategoryName)
                .navigationTitle(navigationContext.contentListTitle)
        } detail: {
            AnimalDetailView(animal: navigationContext.selectedAnimal)
        }
    }
}
