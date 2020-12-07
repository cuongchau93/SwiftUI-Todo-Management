//
//  CreateTodoView.swift
//  TodoManagement
//
//  Created by Chau, Cuong | DCMS on 2020/12/07.
//  Copyright © 2020 Chau, Cuong | DCMS. All rights reserved.
//

import SwiftUI

struct CreateTodoView: View {
    @State var todoTitle = ""
    @State var isImportant = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoStorage: TodoStorage
    
    var body: some View {
        List{
            Section{
                TextField("Ex. Input your Todo", text: $todoTitle)
            }
            Section{
                Toggle(isOn: $isImportant) {
                    Text("Important")
                }
            }
            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        self.todoStorage.toDos.append(TodoItem(title: self.todoTitle, important: self.isImportant))
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(todoTitle.isEmpty)
                    Spacer()
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView()
        .environmentObject(TodoStorage())
    }
}
