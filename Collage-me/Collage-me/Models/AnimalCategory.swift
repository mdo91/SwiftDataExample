//
//  AnimalCategory.swift
//  Collage-me
//
//  Created by Mahmoud Aoata on 21/05/2025.
//

import Foundation
import SwiftData

@Model
final class AnimalCategory {
    @Attribute(.unique) var name: String
    
    @Relationship(deleteRule: .cascade, inverse: \Animal.category)
    var animals = [Animal]()
    
    init(name: String) {
        self.name = name
    }
}
