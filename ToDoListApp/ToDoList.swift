//
//  ToDoList.swift
//  ToDoListApp
//
//  Created by Elin Simonsson on 2023-01-02.
//

import Foundation
import FirebaseFirestore

class ToDoList : ObservableObject {
    @Published var list = [Item]()
    let db = Firestore.firestore()
    
    func addItem (itemName: String) {
        let item = Item(name: itemName)
        
            do {
                _ = try db.collection("items").addDocument(from: item)
                print("successed to save")
            } catch {
                print("Error saving to Firebase")
        }
    }
    
    func listenToFirestore() {
        db.collection("items").addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {return}
            
            if let error = error {
                print("error \(error)")
            } else {
                self.list.removeAll()
                for document in snapshot.documents {
                    let result = Result {
                        try document.data(as: Item.self)
                    }
                    switch result {
                    case .success(let item) :
                        self.list.append(item)
                        print("snapshotListener körs, \(item.name), \(item.done)")
                        
                    case .failure(let error) :
                        print("failed \(error)")
                    }
                }
            }
        }
    }
    
    func updateToggleClicked (currentItem: Item) {
        if let id = currentItem.id {
            db.collection("items").document(id).updateData(["done" : !currentItem.done])
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        for index in indexSet {
            let item = list[index]
            if let id = item.id {
                db.collection("items").document(id).delete()
            }
        }
    }
}
