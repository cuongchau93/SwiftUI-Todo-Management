//
//  ContentView.swift
//  TodoManagement
//
//  Created by Chau, Cuong | DCMS on 2020/12/07.
//  Copyright © 2020 Chau, Cuong | DCMS. All rights reserved.
//

import SwiftUI

struct ToDoList: View {
    @EnvironmentObject var todoStorage: TodoStorage

    var body: some View {
        NavigationView {
            List {
                ForEach(todoStorage.toDos) { todo in
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
                }.onDelete(perform: { indexSet in
                    if let index = indexSet.first {
                        self.todoStorage.toDos.remove(at: index)
                    }
                })
            }
            .navigationBarTitle("To Dos")
            .navigationBarItems(trailing: NavigationLink(destination: CreateTodoView()) {
                Text("Add")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList().environmentObject(TodoStorage())
    }
}
