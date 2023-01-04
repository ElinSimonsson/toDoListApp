//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import SwiftUI
import Firebase

@main
struct ToDoListAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
