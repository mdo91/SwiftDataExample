//
//  Collage_meApp.swift
//  Collage-me
//
//  Created by Mahmoud Aoata on 21/05/2025.
//

import SwiftUI
import SwiftData

@main
struct Collage_meApp: App {


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: AnimalCategory.self)
        #if os(macOS)
        .commands(content: {
            SidebarCommands()
        })
        #endif
    }
}
