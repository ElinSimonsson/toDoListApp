//
//  AddToDoItemView.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import SwiftUI

struct AddToDoItemView: View {
    @StateObject var toDoList = ToDoList()
    @State private var newItemName = ""
    @State var showAlert = false
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
        })
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error!"),
                          message: Text("You can´t save an object without content!"),
                          dismissButton: .default(Text("OK")))
                }
    }
    
    func saveItem () {
        if self.newItemName.isEmpty {
            showAlert = true
        } else {
            toDoList.addItem(itemName: self.newItemName)
            presentationMode.wrappedValue.dismiss()
        }
    }
}


