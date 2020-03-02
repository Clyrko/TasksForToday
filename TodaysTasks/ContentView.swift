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
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.gray)
                            imageScale(.large)
                        }
                    }
                }.font(.headline)
            }
        }
    .navigationBarTitle(Text("Things To Do"))
    .navigationBarItems(trailing: EditButton())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
