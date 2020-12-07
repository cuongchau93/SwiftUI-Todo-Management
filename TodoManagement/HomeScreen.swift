//
//  ContentView.swift
//  TodoManagement
//
//  Created by Chau, Cuong | DCMS on 2020/12/07.
//  Copyright © 2020 Chau, Cuong | DCMS. All rights reserved.
//

import SwiftUI

struct ToDoList: View {
    var body: some View {

        
        NavigationView {
            List {
                ForEach([TodoItem(title: "Task 1", important: false), TodoItem(title: "Task 2", important: true)]
                ) { todo in
                    
                    if(todo.important) {
                        Text(todo.title)
                        .bold()
                            .foregroundColor(.white)
                        .padding(4)
                        .background(Rectangle())
                            .foregroundColor(.red)
                        .cornerRadius(10000)
                    } else {
                        Text(todo.title)
                    }
                }
            }
        }.navigationBarTitle("To Do List")
            .navigationBarItems(trailing: NavigationLink(destination: ToDoList())) {
                Text("Add")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
