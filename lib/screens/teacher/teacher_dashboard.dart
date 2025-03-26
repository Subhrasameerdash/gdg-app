import 'package:flutter/material.dart';
import 'teacher_assignments.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  int _selectedTab = 0; // 0 for Dashboard, 1 for Assignments

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teacher Dashboard")),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Assignment...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),

          // Tab Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                },
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    color: _selectedTab == 0 ? Colors.blue : Colors.black,
                    fontWeight: _selectedTab == 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                child: Text(
                  "Assignments",
                  style: TextStyle(
                    color: _selectedTab == 1 ? Colors.blue : Colors.black,
                    fontWeight: _selectedTab == 1 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),

          // Show Content Based on Selected Tab
          Expanded(
            child: _selectedTab == 0 ? _dashboardView() : TeacherAssignments(),
          ),
        ],
      ),
    );
  }

  // Dashboard View
  Widget _dashboardView() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Total Assignment Submission
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Total Assignment Submission", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.8, // Example value (80% submissions)
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                    minHeight: 10,
                  ),
                  SizedBox(height: 5),
                  Text("80% Students Submitted • 20% Not Submitted"),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Student Performance Rating
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Student Performance Rating", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(9, (index) {
                      return ElevatedButton(
                        onPressed: () {}, // TODO: Implement class-wise navigation
                        child: Text("Sec ${String.fromCharCode(65 + index)}"),
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Center(child: TextButton(onPressed: () {}, child: Text("View All"))),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Top Scorers
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Top scorers achieving no AI Badge",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Placeholder for Top Scorers (Just for UI)
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Column(
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.grey[300]), // Placeholder
                  SizedBox(height: 5),
                  Text("Class ${index + 1}"),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}