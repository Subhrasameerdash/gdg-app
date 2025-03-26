import 'package:flutter/material.dart';
import '../services/google_auth.dart';

class UploadAssignmentScreen extends StatelessWidget {
  final GoogleDriveService _googleDriveService = GoogleDriveService();

  UploadAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Assignment")),

      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            print("🟢 Button Clicked: Starting authentication...");
            await _googleDriveService.authenticate();

            print("🟢 Authentication completed. Uploading file...");
            String? fileId = await _googleDriveService.uploadFileToDrive();

            if (fileId != null) {
              print("✅ File uploaded successfully! ID: $fileId");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("✅ File uploaded! ID: $fileId")),
              );
            } else {
              print("❌ File upload failed.");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("❌ Upload failed")),
              );
            }
          },
          child: const Text("Upload Assignment to Google Drive"),
        ),
      ),
    );
  }
}
