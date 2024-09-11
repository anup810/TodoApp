//
//  TodoCellView.swift
//  TodoApp
//
//  Created by Anup Saud on 2024-09-10.
//

import SwiftUI

struct TodoCellView: View {
    let todoItem : TodoItem
    let onChnaged:(TodoItem) -> Void

    

    var body: some View {
        HStack{
            Image(systemName: todoItem.isCompleted ? "checkmark.square": "square")
                .onTapGesture {
                    // Toggle the completed status when tapped
                    todoItem.isCompleted = !todoItem.isCompleted
                    onChnaged(todoItem)
                }
            if todoItem.isCompleted{
                Text(todoItem.title ?? "")
            }else{
                TextField("", text: Binding(get: {
                    todoItem.title ?? ""
                }, set: { newValue in
                    todoItem.title = newValue
                
                })).onSubmit {
                    onChnaged(todoItem)
                }
            }
        }
    }
}


