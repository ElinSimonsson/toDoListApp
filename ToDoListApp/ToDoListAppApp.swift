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
    
    @StateObject var toToList = ToDoList()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(toToList)
        }
    }
}
