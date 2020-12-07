//
//  TodoItem.swift
//  TodoManagement
//
//  Created by Chau, Cuong | DCMS on 2020/12/07.
//  Copyright © 2020 Chau, Cuong | DCMS. All rights reserved.
//

import Foundation

struct TodoItem : Identifiable, Codable {
    var id = UUID()
    var title: String
    var important: Bool
    
    init(title: String, important: Bool) {
        self.title = title
        self.important = important
    }
    
}

class TodoStorage: ObservableObject {
    @Published var toDos = [TodoItem]() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(toDos), forKey: "toDos")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.value(forKey: "toDos") as? Data {
            if let userDefaultTodos = try? PropertyListDecoder().decode(Array<TodoItem>.self, from: data) {
                toDos = userDefaultTodos
            }
        }
    }
}
