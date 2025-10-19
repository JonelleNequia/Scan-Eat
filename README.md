## 📂 Project Directory Structure

Below is the recommended structure of the project for better maintainability and readability:
ScanEat/
├─ android/                   # Android native files (Manifest, Gradle, etc.)
├─ ios/                       # iOS native files
├─ lib/                       # Main source code of the Flutter app
│  ├─ main.dart               # App entry point
│  ├─ screens/               # Screens / pages (e.g., SignInScreen, HomeScreen)
│  ├─ widgets/               # Reusable UI components (buttons, textfields, etc.)
│  ├─ models/                # (Optional) Data models
│  └─ services/              # (Optional) API, database, or backend services
│
├─ assets/                    # Static files like images, icons, fonts
│  ├─ icon/                  # App icons and launcher assets
│  │   └─ scaneat_logo.png
│  ├─ images/                # UI images, splash backgrounds, illustrations
│  │   └─ background.png
│  └─ fonts/                 # (Optional) Custom fonts
│
├─ test/                      # Unit and widget tests
├─ pubspec.yaml              # Project dependencies and asset registration
└─ README.md                # Project documentation (this file)
