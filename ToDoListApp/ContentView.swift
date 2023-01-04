//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var toDoList : ToDoList
    var body: some View {
        NavigationView {
            List() {
                ForEach($toDoList.list) { $item in
                    RowView(item: item)
                }
                .onDelete() { indexSet in
                    delete(indexSet: indexSet)
                }
            }
            .navigationTitle("To-do-list")
            .navigationBarItems(trailing: NavigationLink(destination: AddToDoItemView()){
                Image(systemName: "plus")
                
            })
        }
        .onAppear() {
            print("appen körs")
        }
    }
    
    func delete(indexSet: IndexSet) {
        toDoList.list.remove(atOffsets: indexSet)
    }
}


struct RowView: View {
    @State var item : Item
    var body: some View {
        HStack {
            Text(item.name)
            Toggle("", isOn: $item.isCompleted)
        }
    }
    
    
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
