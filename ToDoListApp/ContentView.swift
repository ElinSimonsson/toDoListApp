//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @StateObject var toDoList = ToDoList()
    let db = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(toDoList.list) { item in
                    RowView(item: item)
                }
                .onDelete() { indexSet in
                    toDoList.deleteItem(indexSet: indexSet)
                }
            }
            .navigationTitle("To-do-list")
            .navigationBarItems(trailing: NavigationLink(destination: AddToDoItemView()){
                Image(systemName: "plus")
            })
        }
        .onAppear() {
            toDoList.listenToFirestore()
        }
    }
    
    struct RowView: View {
        @StateObject var toDoList = ToDoList()
        var item : Item
        var body: some View {
            HStack {
                Text(item.name)
                Spacer()
                Image(systemName: item.done ? "checkmark.circle" : "circle")
                    .imageScale(.large)
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        
                        toDoList.updateToggleClicked(currentItem: item)
                    }
            }
        }
        
        
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
