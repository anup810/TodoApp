//
//  ContentView.swift
//  TodoApp
//
//  Created by Anup Saud on 2024-09-10.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<TodoItem>
    @State private var title: String = ""
    
    private var isFormValid: Bool{
        !title.isEmptyorWhiteSpace
    }
    private func saveTodoItem(){
        let todoItem = TodoItem(context: context)
        todoItem.title = title
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    private var pendingTodoItem: [TodoItem]{
        todoItems.filter {!$0.isCompleted}
    }
    private var completedTodoItem: [TodoItem]{
        todoItems.filter{$0.isCompleted}
    }
    private func updateTodoItem(_ todoItem: TodoItem){
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    private func deleteTodoItem(todoItem: TodoItem){
        context.delete(todoItem)
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if isFormValid{
                        saveTodoItem()
                        title = ""
                        
                    }
                }
            List{
                Section("Pending"){
                    if pendingTodoItem.isEmpty{
                        ContentUnavailableView("No items found", systemImage: "doc")
                    } else{
                        ForEach(pendingTodoItem){todoItem in
                            TodoCellView(todoItem: todoItem, onChnaged: updateTodoItem)
                            
                        }.onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let todoItems = pendingTodoItem[index]
                                deleteTodoItem(todoItem: todoItems)
                            } 
                        })
                    }
                }
                Section("Completed"){
                    if completedTodoItem.isEmpty{
                        ContentUnavailableView("No items found", systemImage: "doc")
                    }else{
                        ForEach(completedTodoItem){todoItem in
                            TodoCellView(todoItem: todoItem, onChnaged: updateTodoItem)
                            
                        }.onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let todoItems = completedTodoItem[index]
                                deleteTodoItem(todoItem: todoItems)
                            }
                        })
                    }
                }
            }.listStyle(.plain)
            Spacer()
        }
        .padding()
        .navigationTitle("Todo")
        
    }
}

#Preview {
    NavigationStack{
        ContentView()
            .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
    }
}
