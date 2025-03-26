import 'package:flutter/material.dart';

class UploadAssignment extends StatelessWidget {
  const UploadAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_upload, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text("Upload Assignment", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement file picker
              },
              child: Text("Choose File"),
            ),
          ],
        ),
      ),
    );
  }
}
