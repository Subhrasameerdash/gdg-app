import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isTeacher = false; // Default to Student

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login / Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign up to start your journey or login if you have an account",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Toggle Buttons for Teacher/Student
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text("Teacher"),
                  selected: isTeacher,
                  onSelected: (selected) {
                    setState(() {
                      isTeacher = true;
                    });
                  },
                  selectedColor: Colors.green,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text("Student"),
                  selected: !isTeacher,
                  onSelected: (selected) {
                    setState(() {
                      isTeacher = false;
                    });
                  },
                  selectedColor: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ],
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

            // Additional Fields Based on Selection
            if (isTeacher) ...[
              TextField(
                decoration: InputDecoration(labelText: "School/College Name", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: "Subject Specialization", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
            ] else ...[
              TextField(
                decoration: InputDecoration(labelText: "Grade/Year", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: "Stream (if applicable)", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
            ],

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

            // Google Login
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text("Sign up with Google", style: TextStyle(color: Colors.black)),
              ),
            ),

            SizedBox(height: 20),

            // Login Link
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Login"),
              ),
            ),

            SizedBox(height: 10),

            // Privacy Policy
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
