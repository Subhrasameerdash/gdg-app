import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final bool isTeacher;
  final Function(bool) onLoginSuccess;

  const LoginForm({super.key, required this.isTeacher, required this.onLoginSuccess});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  void _handleLogin() {
    // TODO: Implement actual authentication logic
    widget.onLoginSuccess(widget.isTeacher);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _mobileController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder()),
        ),
        SizedBox(height: 10),
        
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
        ),
        SizedBox(height: 10),
        
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (bool? value) {
                setState(() => rememberMe = value ?? false);
              },
            ),
            Text("Remember me"),
          ],
        ),
        SizedBox(height: 10),

        ElevatedButton(
          onPressed: _handleLogin,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(widget.isTeacher ? "Login as Teacher" : "Login as Student", style: TextStyle(color: Colors.white)),
        ),

        TextButton(
          onPressed: () {},
          child: Text("Sign up"),
        ),
      ],
    );
  }
}
