---

# **📚 Assistant Teacher App**  
An **AI-powered assistant** that helps teachers by automating tasks like **grading, report generation, and assignment uploads** using **Google Drive integration** and **AI models**.  

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
Follow these steps to set up the project on your local machine.

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/your-username/Assistant-Teacher-App.git
cd Assistant-Teacher-App
```

### **2️⃣ Install Dependencies**
Navigate to the project folder and run:
```sh
flutter pub get
```

### **3️⃣ Set Up Google Drive API (Service Account)**
Since the app interacts with Google Drive, follow these steps:

#### **🔹 Step 1: Enable Google Drive API**
1. Open [Google Cloud Console](https://console.cloud.google.com/).  
2. Create a new project (if not already created).  
3. Navigate to **APIs & Services > Enable APIs and Services**.  
4. Search for **Google Drive API** and enable it.

#### **🔹 Step 2: Create a Service Account**
1. In **Google Cloud Console**, go to **IAM & Admin > Service Accounts**.  
2. Click **Create Service Account** and fill in the details.  
3. Assign the **Editor** role to allow file uploads.  
4. Click **Create Key** and select **JSON** format.  
5. Download the JSON file (e.g., `service_account.json`).  

#### **🔹 Step 3: Move JSON Credentials to the Project**
1. Rename the downloaded JSON file to **credentials.json**.  
2. Place it inside the **assets/** folder of the project.  

#### **🔹 Step 4: Share a Google Drive Folder with the Service Account**
1. Go to your **Google Drive** and create a new folder.  
2. Right-click the folder and choose **Share**.  
3. Copy the **service account email** from the JSON file.  
4. Share the folder with that email and grant **Editor access**.  

---

## **📡 Running the Application**
Once the setup is complete, you can run the application:

```sh
flutter run
```

If you're using an emulator:
```sh
flutter emulators --launch <emulator_name>
flutter run
```

To build for Android:
```sh
flutter build apk
```

To build for iOS (Mac required):
```sh
flutter build ios
```

---

## **📡 Google Drive Authentication (Service Account)**
### **🔹 How Authentication Works**
The app authenticates using a **Google Service Account**, allowing it to upload assignments to Google Drive. When you press **"Upload Assignment"**, the following happens:  
1. The **service account credentials.json** is loaded.  
2. The app connects to **Google Drive API** using OAuth.  
3. A **file picker** lets the user choose a file.  
4. The selected file is uploaded to the shared **Google Drive folder**.  

### **🔹 Code Implementation**
#### **📜 Google Authentication Service (`google_auth.dart`)**
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
This project integrates an **AI model** for **assignment checking, grading, and automation**. The model is hosted in an external GitHub repository:

🔗 **External AI Model Repository:**  
[GDG-Codes Repository](https://github.com/Subhrasameerdash/gdg-codes)

### **🔹 How to Integrate the AI Model**
1. Clone the external repo:
   ```sh
   git clone https://github.com/Subhrasameerdash/gdg-codes.git
   ```
2. Move the required AI model files into your **Assistant Teacher App** inside the `lib/ai_model/` folder.  
3. Install required dependencies:
   ```sh
   pip install -r requirements.txt
   ```
4. Modify your **Flutter app** to interact with the AI model via an API or direct function calls.

---

## **🛠 Troubleshooting**
### **🔹 App Not Running?**
- Make sure you installed **Flutter & Dart** properly.  
- Run `flutter doctor` to check for missing dependencies.  
- Ensure `credentials.json` is in the correct folder (`assets/`).  
- Restart the app after making changes.  

### **🔹 File Not Uploading to Google Drive?**
- Ensure the **Google Drive API is enabled** in Google Cloud.  
- Check if the **service account email** has **Editor access** to the shared Drive folder.  
- Restart the app and try again.  

### **🔹 AI Model Not Working?**
- Make sure you installed **Python 3.8+**.  
- Run `pip install -r requirements.txt` inside the `gdg-codes` folder.  
- Check the API connection if using an external ML service.  

---

## **👨‍💻 Contributors**
- **[Shubham Nayak](https://github.com/smallBrat)** – *Frontend Developer*  
- **[Subhra Sameer Dash](https://github.com/Subhrasameerdash)** – *ML Model Contributor*   

---

## **📜 License**
This project is open-source and follows the **MIT License**.

---
