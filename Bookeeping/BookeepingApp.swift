//
//  BookeepingApp.swift
//  Bookeeping
//
//  Created by MSENSIS on 22/7/24.
//

import SwiftUI

@main
struct BookeepingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(textInput: "")
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
