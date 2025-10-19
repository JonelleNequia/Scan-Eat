## 🚀 Features

- 📱 Beautiful, responsive UI built with Flutter  
- 🔐 Simple sign-in form with email & password fields  
- 🖼️ Custom launcher icon and splash screen  
- 💾 Local asset support (images, icons, logos)  
- 📤 Ready for release build and APK distribution  

---

## 📂 Project Structure
lib/
├─ main.dart              # Entry point of the app
├─ screens/              # UI screens
├─ widgets/              # Custom widgets
assets/
├─ icon/                # App icons and logos
├─ images/              # UI and background images
android/
└─ app/
└─ src/…

---

## 🖼️ Adding an `assets` Folder in Android Studio

If you uploaded images to GitHub and cloned the project but they’re not appearing in your app, make sure the `assets` folder is correctly added.

### ✅ Step-by-Step Guide

1. **Create the folder (if not existing):**  
   - In Android Studio, right-click the root of your project → **New → Directory** → name it `assets`.
   - Inside it, create subfolders like `images`, `icon`, etc.
  
assets/
├─ icon/
│   └─ scaneat_logo.png
└─ images/
└─ background.png

2. **Register the assets in `pubspec.yaml`:**

Open the `pubspec.yaml` file and make sure it looks like this:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/icon/
    - assets/images/
