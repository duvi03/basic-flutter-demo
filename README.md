# **Basic Flutter Demo App**

This is a simple Flutter demo application showcasing core Flutter features and architectural patterns, ideal for beginners and intermediate developers. The project integrates essential widgets, SQLite database operations, state management solutions, and API handling.

## 🚀 Features

### 1. **Flutter Widgets**
- Implementation of both **StatelessWidget** and **StatefulWidget**
- Common UI elements:
  - `TextField` for user input
  - `ElevatedButton` and other interactive buttons
  - List Display Widgets:
    - **Simple `ListView`** – static list with predefined children
    - `ListView.builder` – for dynamic list rendering
    - `ListView.separated` – for lists with custom separators
    - Horizontal `ListView` – scrollable lists in horizontal direction
    - `GridView.builder` – for grid-style item layouts
  - Navigation:
    - `TabBar` and `TabBarView` for tabbed navigation interface

### 2. **CRUD Operations with SQLite**
- Local storage using the `sqflite` package
- Full CRUD functionality:
  - Create, Read, Update, and Delete items
  - Persistent data storage on the device
  - Clean separation of database logic

### 3. **Product List with REST API using GetX**
- RESTful API integration to fetch and display product data
- `GetX` used for:
  - State management
  - API communication
  - Dependency injection and reactive UI updates

### 4. **Dark Theme with Provider**
- Theming managed using the `provider` package
- Features:
  - Toggle between light and dark themes
  - State persists with theme settings
  - Seamless transition with responsive UI updates

## 🛠️ Tech Stack

- **Flutter** (latest stable version)
- **Dart**
- **SQLite** via `sqflite` package
- **GetX** for state management and routing
- **Provider** for theme switching
- **HTTP** for API communication

## 📦 Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/basic-flutter-demo-app.git
   cd basic-flutter-demo-app
