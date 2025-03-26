// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Import a single signup screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTeacher = true; // Default selection is Teacher

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login / Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login / Sign up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Sign up to start your journey or login if you have an account"),
            SizedBox(height: 20),

            // Toggle between Teacher and Student
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
                ),
              ],
            ),
            SizedBox(height: 20),

            // Mobile Number Input
            TextField(
              decoration: InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder()),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),

            // Password Input
            TextField(
              decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 10),

            // Login Button
            ElevatedButton(
              onPressed: () {
                if (isTeacher) {
                  Navigator.pushNamed(context, '/teacher_dashboard');
                } else {
                  Navigator.pushNamed(context, '/student_dashboard');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                isTeacher ? "Login as Teacher" : "Login as Student",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),

            // Google Login
            Text("Or login with"),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.login),
              label: Text("Google"),
            ),

            // Signup Option (Navigates to Signup Screen)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(isTeacher: isTeacher),
                  ),
                );
              },
              child: Text("Don't have an account? Sign Up"),
            ),

            // Terms and Conditions
            Text(
              "By continuing, you agree that you have read and accepted our T&C's and privacy policies.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
