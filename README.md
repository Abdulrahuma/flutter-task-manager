# Flutter Task Manager App 📝

A simple cross-platform Task Manager built using **Flutter**, created as part of a Flutter Internship Take-Home Assignment.

The app allows users to:
- View tasks
- Add new tasks
- Mark tasks as completed  
using a public REST API.

---

## 🚀 Features

- 📋 Fetch task list from API
- ➕ Add new tasks
- ✅ Mark tasks as completed
- 🔄 Real-time UI update
- ⏳ Loading indicator
- ❗ Error handling
- 📱 Works on Android
- 🌐 Works on Web (Chrome)

---

## 🔌 API Used

**JSONPlaceholder (Mock API)**  
https://jsonplaceholder.typicode.com

### Endpoints:
- `GET /todos` – Fetch tasks  
- `POST /todos` – Add task  
- `PATCH /todos/{id}` – Update task status  

⚠️ Note:  
This is a mock API, so added tasks do not persist after refresh.  
The UI is updated locally to simulate real behavior.

---

## 🛠 Tech Stack

- Flutter
- Dart
- REST API
- HTTP package

---

## 📁 Project Structure

lib/
├── models/
│ └── task.dart
├── services/
│ └── api_service.dart
├── screens/
│ └── task_list_screen.dart
└── main.dart
2. Install dependencies
flutter pub get

3. Run the app
flutter run


✔ Works on:

Android Emulator

Chrome (Web)
## 📸 Screenshots

### 📱 Android App
![Android Screenshot](screenshots/android.png)

### 🌐 Web App
![Web Screenshot](screenshots/chrome.png)

