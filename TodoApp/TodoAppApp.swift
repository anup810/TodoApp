//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Anup Saud on 2024-09-10.
//

import SwiftUI

@main
struct TodoAppApp: App {
    let provider = CoreDataProvider()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
                    .environment(\.managedObjectContext, provider.viewContext)
            }
        }
    }
}
