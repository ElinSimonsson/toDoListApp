//
//  ToDoList.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import Foundation

class ToDoList : ObservableObject {
    @Published var list = [Item]()
    
    init () {
        addMockData()
    }
    
    func addMockData () {
        list.append(Item(name: "Handla"))
        list.append(Item(name: "Tvätta kläder"))
        list.append(Item(name: "Laga mat"))
        list.append(Item(name: "Natta barnen"))
    }
}
