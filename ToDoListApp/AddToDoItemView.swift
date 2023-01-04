//
//  AddToDoItemView.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import SwiftUI

struct AddToDoItemView: View {
    @EnvironmentObject var toDoList : ToDoList
    
    @State private var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack{
                List {
                    TextField("New item", text: $newItemName)
                }
            }
    }
        .navigationBarItems(trailing: Button("Save") {
            saveItem()
            presentationMode.wrappedValue.dismiss()
        })
    }
    
    func saveItem () {
        let newItem = Item(name: self.newItemName)
        toDoList.list.append(newItem)
    }
}


