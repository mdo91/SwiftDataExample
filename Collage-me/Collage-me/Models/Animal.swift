//
//  Animal.swift
//  Collage-me
//
//  Created by Mahmoud Aoata on 21/05/2025.
//

import Foundation
import SwiftData

@Model
final class Animal {
    var name: String
    var diet: Diet
    var category: AnimalCategory?
    
    init(name: String, diet: Diet) {
        self.name = name
        self.diet = diet
    }
}

extension Animal {
    enum Diet: String, CaseIterable, Codable {
        case carnivorous = "Carnivorous"
        case herbivorous = "Herbivorous"
        case omnivorous = "Omnivorous"
    }
}
