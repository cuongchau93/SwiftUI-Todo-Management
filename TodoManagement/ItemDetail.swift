//
//  ItemDetail.swift
//  TodoManagement
//
//  Created by Chau, Cuong | DCMS on 2020/12/07.
//  Copyright © 2020 Chau, Cuong | DCMS. All rights reserved.
//
import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var todoStorage: TodoStorage
    @Environment(\.presentationMode) var presentationMode

    var item: TodoItem
    
    var itemIndex: Int {
        todoStorage.toDos.firstIndex(where: { $0.id == item.id })!
    }
    
    @ViewBuilder
    var body: some View {
        List {
            Section{
                TextField("Ex. Input your Todo", text: $todoStorage.toDos[itemIndex].title)
            }
            Section{
                Toggle(isOn: $todoStorage.toDos[itemIndex].important) {
                    Text("Important")
                }
            }
            Section {
                HStack {
                    Spacer()
                    Button("Save") {
//                        self.todoStorage.toDos.append(TodoItem(title: self.item.title, important: self.item.important))
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(item.title.isEmpty)
                    Spacer()
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: TodoItem(title: "aahaha", important: true))
        }
    }
}
