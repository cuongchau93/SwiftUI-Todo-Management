//
//  ItemDetail.swift
//  TodoManagement
//
//  Created by Chau, Cuong | DCMS on 2020/12/07.
//  Copyright © 2020 Chau, Cuong | DCMS. All rights reserved.
//
import SwiftUI

struct ItemDetail: View {
    
    var item: TodoItem
    
    var body: some View {
        HStack {
            Text(item.title)
            item.important ? Text("Important") : Text("Futile")
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: TodoItem(title: "aahaha", important: false))
        }
    }
}
