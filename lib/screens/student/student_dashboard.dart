import 'package:flutter/material.dart';
import 'pending_assignments.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _selectedTab = 0; // 0 for Dashboard, 1 for Pending Assignments

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Dashboard")),
      body: Column(
        children: [
          // Top Navigation Tabs
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
                  "Pending Assignments",
                  style: TextStyle(
                    color: _selectedTab == 1 ? Colors.blue : Colors.black,
                    fontWeight: _selectedTab == 1 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          
          // Content Changes Based on Selected Tab
          Expanded(
            child: _selectedTab == 0 ? _dashboardView() : PendingAssignments(),
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
        children: [
          Text("Assignment Progress", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          SizedBox(height: 10),

          // Assignment Progress Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 40, height: 10, color: Colors.green),
              SizedBox(width: 5),
              Container(width: 40, height: 10, color: Colors.yellow),
              SizedBox(width: 5),
              Container(width: 40, height: 10, color: Colors.orange),
              SizedBox(width: 5),
              Container(width: 40, height: 10, color: Colors.grey),
            ],
          ),
          SizedBox(height: 10),
          Text("You are pending with more assignments"),

          SizedBox(height: 20),

          // Assignment Scores Table
          Expanded(
            child: ListView(
              children: [
                _assignmentRow("Physics", "10/10"),
                _assignmentRow("Chemistry", "9/10"),
                _assignmentRow("Biology", "6/10"),
                _assignmentRow("Maths", "8/10"),
                _assignmentRow("History", "9/10"),
                _assignmentRow("EVS", "7/10"),
                _assignmentRow("UHV", "8/10"),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Top Scorers
          Text("Top scorers achieving no AI Badge", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _topScorerBadge("Hero"),
              SizedBox(width: 10),
              _topScorerBadge("Genius"),
              SizedBox(width: 10),
              _topScorerBadge("Expert"),
            ],
          ),
          SizedBox(height: 10),
          Text("You are among the top 100 students"),
        ],
      ),
    );
  }

  // Helper Function to Create Assignment Row
  Widget _assignmentRow(String subject, String score) {
    return Card(
      child: ListTile(
        title: Text(subject),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(score),
            SizedBox(width: 10),
            TextButton(onPressed: () {}, child: Text("View", style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }

  // Helper Function to Create Top Scorer Badge
  Widget _topScorerBadge(String title) {
    return Column(
      children: [
        CircleAvatar(radius: 25, backgroundColor: Colors.blueAccent),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
