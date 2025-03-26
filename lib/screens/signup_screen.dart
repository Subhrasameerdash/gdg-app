import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final bool isTeacher; // ✅ Define isTeacher parameter

  const SignupScreen({super.key, required this.isTeacher}); // ✅ Required parameter

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isTeacher ? "Teacher Signup" : "Student Signup")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign up as ${widget.isTeacher ? "Teacher" : "Student"}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Common Input Fields
            TextField(
              decoration: InputDecoration(labelText: "Mobile number", border: OutlineInputBorder()),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "OTP", border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: Text("Generate OTP")),
              ],
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 10),

            // Extra Fields Based on Selection
            if (widget.isTeacher) ...[
              TextField(
                decoration: InputDecoration(labelText: "School/College Name", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: "Subject Specialization", border: OutlineInputBorder()),
              ),
            ] else ...[
              TextField(
                decoration: InputDecoration(labelText: "Grade/Year", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: "Stream (if applicable)", border: OutlineInputBorder()),
              ),
            ],
            SizedBox(height: 10),

            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text("Remember me"),
              ],
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text("Sign Up", style: TextStyle(color: Colors.white)),
              ),
            ),

            SizedBox(height: 10),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Login"),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "By continuing, you agree that you have read and accepted our T&C's and privacy policies",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
