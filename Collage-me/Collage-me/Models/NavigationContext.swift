//
//  NavigationContext.swift
//  Collage-me
//
//  Created by Mahmoud Aoata on 21/05/2025.
//
import SwiftUI

@Observable
class NavigationContext {
    var selectedAnimalCategoryName: String?
    var selectedAnimal: Animal?
    var columnVisiblity: NavigationSplitViewVisibility
    
    var sidebarTitle = "Categories"
    
    var contentListTitle: String {
        if let selectedAnimalCategoryName {
            selectedAnimalCategoryName
        } else {
            ""
        }
    }
    
    init(selectedAnimalCategoryName: String? = nil,
         selectedAnimal: Animal? = nil,
         columnVisiblity: NavigationSplitViewVisibility = .automatic) {
        
        self.selectedAnimalCategoryName = selectedAnimalCategoryName
        self.selectedAnimal = selectedAnimal
        self.columnVisiblity = columnVisiblity
    }
}

