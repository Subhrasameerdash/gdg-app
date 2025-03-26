import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:file_picker/file_picker.dart';

class GoogleDriveService {
  late AuthClient? _client; // Make it nullable to avoid crashes
  late drive.DriveApi _driveApi;

  /// Authenticate using the service account JSON file
  Future<void> authenticate() async {
    try {
      print("🔄 Loading credentials.json...");
      final credentialsJson = await rootBundle.loadString('assets/credentials.json');

      print("🔄 Parsing credentials...");
      final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsJson));

      print("🔄 Authenticating...");
      final client = await clientViaServiceAccount(
        credentials,
        [drive.DriveApi.driveFileScope], // Scope for Google Drive access
      );

      _client = client;
      _driveApi = drive.DriveApi(client);
      print("✅ Service Account Authentication Successful!");
    } catch (e) {
      print("❌ Authentication Failed: $e");
    }
  }

  /// Upload file to Google Drive
  Future<String?> uploadFileToDrive() async {
    try {
      if (_client == null) {
        print("❌ Error: No authenticated client found.");
        return null;
      }

      print("🔄 Opening file picker...");
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        print("✅ File selected: ${result.files.single.name}");

        File file = File(result.files.single.path!);
        var driveFile = drive.File();
        driveFile.name = result.files.single.name;

        print("🔄 Uploading file to Google Drive...");
        var response = await _driveApi.files.create(
          driveFile,
          uploadMedia: drive.Media(file.openRead(), file.lengthSync()),
        );

        // 🔹 Give public access (Optional: Adjust permissions as needed)
        await _driveApi.permissions.create(
          drive.Permission()
            ..type = "anyone"
            ..role = "reader",
          response.id!,
        );

        print("✅ File uploaded successfully! ID: ${response.id}");
        return response.id; // Returns Google Drive file ID
      } else {
        print("⚠ No file selected.");
      }
    } catch (e) {
      print("❌ Upload failed: $e");
    }
    return null;
  }

  /// Close the authenticated client
  void close() {
    _client?.close();
  }
}
