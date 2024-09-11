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
                    ForEach(pendingTodoItem){todoItem in
                        Text(todoItem.title ?? "")
                        
                    }
                }
                Section("Completed"){
                    ForEach(completedTodoItem){todoItem in
                        Text(todoItem.title ?? "")
                        
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
