Sure! Here's the full updated file with an **App Download Link** section added near the top for better visibility.

---

# **📚 Assistant Teacher App**  
An **AI-powered assistant** that helps teachers by automating tasks like **grading, report generation, and assignment uploads** using **Google Drive integration** and **AI models**.  

---

## **📲 App Download Link**  
📥 [Open the app in mobile (android/ios)]((https://googledevellopergroup.netlify.app/))  
---

## **🚀 Features**  
✔️ **Upload Assignments to Google Drive** directly from the app  
✔️ **Google Authentication** using a **Service Account**  
✔️ **File Picker** for selecting assignments  
✔️ **AI-Powered Automation** *(Grading, Report Generation, and More)*  
✔️ **Easy Integration** with ML models *(Linking External Repo)*  

---

## **📂 Project Structure**  
The project follows a **structured folder hierarchy** to keep everything organized:

```
📂 Assistant-Teacher-App/
┣ 📂 android/           # Android platform-specific code
┣ 📂 ios/               # iOS platform-specific code
┣ 📂 lib/               # Main Flutter application
┃ ┣ 📂 screens/         # UI Screens (Upload, Dashboard, etc.)
┃ ┣ 📂 services/        # Google Drive Service & Authentication
┃ ┣ 📂 ai_model/        # Integration with AI/ML model
┃ ┣ 📄 main.dart        # Entry point of the application
┣ 📂 assets/            # Stores credentials.json for Google Drive API
┣ 📄 pubspec.yaml       # Dependencies & Flutter Configurations
┣ 📄 README.md          # Project Documentation
┣ 📄 .gitignore         # Files to ignore in GitHub
```

---

## **📌 Prerequisites**  
Before running the application, ensure that you have the following installed on your system:

✅ **Flutter SDK** (Latest Version) – [Download Flutter](https://flutter.dev/docs/get-started/install)  
✅ **Dart SDK** – Installed with Flutter  
✅ **Google Drive API Credentials** (Service Account)  
✅ **Android Studio / VS Code** (for running the Flutter app)  
✅ **Python 3.8+** (For AI Model Integration)  
✅ **Required Python Libraries** (For ML Model)  

---

## **🔧 Installation & Setup**

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/your-username/Assistant-Teacher-App.git
cd Assistant-Teacher-App
```

### **2️⃣ Install Dependencies**
```sh
flutter pub get
```

### **3️⃣ Set Up Google Drive API (Service Account)**

#### 🔹 **Enable Google Drive API**
1. Open [Google Cloud Console](https://console.cloud.google.com/)  
2. Create a new project  
3. Go to **APIs & Services > Enable APIs and Services**  
4. Search and enable **Google Drive API**  

#### 🔹 **Create a Service Account**
1. Go to **IAM & Admin > Service Accounts**  
2. Click **Create Service Account**, fill in details  
3. Assign **Editor** role  
4. Generate and download **JSON key**  

#### 🔹 **Add Credentials to Project**
1. Rename the downloaded JSON to `credentials.json`  
2. Place it inside the `assets/` folder  

#### 🔹 **Share Google Drive Folder**
1. Create a new folder in Google Drive  
2. Share with the service account email from the JSON file  
3. Give **Editor access**

---

## **📡 Running the Application**

### **Run in Debug Mode**
```sh
flutter run
```

### **Launch Emulator (Optional)**
```sh
flutter emulators --launch <emulator_name>
flutter run
```

### **Build APK**
```sh
flutter build apk
```

### **Build for iOS (Mac Required)**
```sh
flutter build ios
```

---

## **🔐 Google Drive Authentication (Service Account)**

### **How It Works**
1. Loads `credentials.json`  
2. Authenticates using OAuth via Service Account  
3. Opens file picker  
4. Uploads selected file to Google Drive folder  

### **Sample Code (`google_auth.dart`)**
```dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';

class GoogleDriveService {
  late AuthClient _client;
  late drive.DriveApi _driveApi;

  Future<void> authenticate() async {
    try {
      final credentialsJson = await rootBundle.loadString('assets/credentials.json');
      final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsJson));

      final client = await clientViaServiceAccount(
        credentials,
        [drive.DriveApi.driveFileScope],
      );

      _client = client;
      _driveApi = drive.DriveApi(client);
      print("✅ Service Account Authentication Successful!");
    } catch (e) {
      print("❌ Authentication Failed: $e");
    }
  }
}
```

---

## **🤖 AI/ML Model Integration**

🔗 **External Repository:**  
[GDG-Codes Repository](https://github.com/Subhrasameerdash/gdg-codes)

### **Integration Steps**
1. Clone the repo  
   ```sh
   git clone https://github.com/Subhrasameerdash/gdg-codes.git
   ```
2. Move model files to `lib/ai_model/`  
3. Install Python dependencies  
   ```sh
   pip install -r requirements.txt
   ```
4. Set up API or direct linking to Flutter app

---

## **🛠 Troubleshooting**

### App Not Running?
- Run `flutter doctor` to diagnose issues  
- Check that all SDKs and dependencies are installed  
- Ensure service account is correctly configured  

---
