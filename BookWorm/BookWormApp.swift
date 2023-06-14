//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Hamza Osama on 14/06/2023.
//

import SwiftUI
import SwiftData

@main
struct BookWormApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
