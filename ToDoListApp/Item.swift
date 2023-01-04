//
//  Item.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import Foundation
import FirebaseFirestoreSwift

struct Item : Identifiable {
    var id = UUID()
    var name: String
    var isCompleted: Bool = false
}
