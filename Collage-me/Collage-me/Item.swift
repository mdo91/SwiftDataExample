//
//  Item.swift
//  Collage-me
//
//  Created by Mahmoud Aoata on 21/05/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
