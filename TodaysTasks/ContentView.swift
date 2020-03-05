//
//  ContentView.swift
//  TodaysTasks
//
//  Created by Jay A. on 3/2/20.
//  Copyright © 2020 Jay A. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What are you doing next?")) {
                    HStack {
                        TextField("New Item", text: self.$newToDoItem)
                        Button(action: {
                            
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            do {
                                
                                try self.managedObjectContext.save()
                            } catch {
                                
                                print(error)
                            }
                            
                            self.newToDoItem = ""
                        }) {
                            
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.gray)
                            imageScale(.large)
                        }
                    }
                }.font(.headline)
                
                Section(header: Text("To Do's")) {
                    
                    ForEach(self.toDoItems) { toDoItem in
                        ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
                    }.onDelete {IndexSet in
                        let deleteItem = self.toDoItems[IndexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            
                            try self.managedObjectContext.save()
                        } catch {
                            
                            print(error)
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text("Things To Do"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
