# TodoApp

A simple to-do list app built with SwiftUI and Core Data, allowing users to manage their tasks with features like adding, editing, completing, and deleting tasks. The app is structured into two sections: Pending and Completed tasks. Users can mark tasks as complete, edit task titles for pending tasks, and delete tasks in either section.

## Features

- **Add Tasks**: Users can add new tasks via a text field.
- **Edit Tasks**: Pending tasks can be edited inline.
- **Complete Tasks**: Users can mark tasks as completed using a checkmark toggle.
- **Delete Tasks**: Tasks can be deleted from both pending and completed sections by swiping.
- **Empty State**: When no tasks are present, a message is displayed indicating no items are found.

## Technologies Used

- **SwiftUI**: For building the user interface.
- **Core Data**: For persistent data storage.
- **MVVM Architecture**: Using `@FetchRequest` and `CoreDataProvider` for data management.

## Getting Started

### Prerequisites

- Xcode 12 or later
- iOS 14.0 or later

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/todoapp.git
    ```

2. Open the project in Xcode:

    ```bash
    open TodoApp.xcodeproj
    ```

3. Build and run the app on the iOS simulator or your physical device.

## Core Data Setup

The project uses Core Data for managing tasks. The `CoreDataProvider` class sets up the Core Data stack and manages the context, allowing you to save, update, and delete tasks.

## Project Structure

- **ContentView.swift**: The main view of the app that displays pending and completed tasks in two sections.
- **TodoCellView.swift**: The custom cell view for displaying and toggling task completion status. Supports inline editing for pending tasks.
- **CoreDataProvider.swift**: Manages the Core Data stack, including saving and loading the to-do items.

## Preview

The app includes a `CoreDataProvider.preview` setup to support SwiftUI previews with mock data. This allows you to see the app in action without needing to enter data manually.


