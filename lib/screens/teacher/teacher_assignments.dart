import 'package:flutter/material.dart';
import 'recheck_list.dart';
import 'defaulters_list.dart';

class TeacherAssignments extends StatefulWidget {
  const TeacherAssignments({super.key});

  @override
  _TeacherAssignmentsState createState() => _TeacherAssignmentsState();
}

class _TeacherAssignmentsState extends State<TeacherAssignments> {
  int _selectedTab = 0; // 0 for Check Scores, 1 for Give Assignments

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teacher Assignments")),
      body: Column(
        children: [
          // Tab Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      _selectedTab == 0 ? Colors.green : Colors.grey[200],
                ),
                child: Text(
                  "Check Scores",
                  style: TextStyle(
                    color: _selectedTab == 0 ? Colors.white : Colors.black,
                    fontWeight:
                        _selectedTab == 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      _selectedTab == 1 ? Colors.green : Colors.grey[200],
                ),
                child: Text(
                  "Assignments",
                  style: TextStyle(
                    color: _selectedTab == 1 ? Colors.white : Colors.black,
                    fontWeight:
                        _selectedTab == 1 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),

          // Content based on selected tab
          Expanded(
            child:
                _selectedTab == 0
                    ? _buildCheckScoresTab()
                    : _buildGiveAssignmentsTab(),
          ),
        ],
      ),
    );
  }

  // Check Scores Tab
  Widget _buildCheckScoresTab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter the class",
              suffixIcon: TextButton(onPressed: () {}, child: Text("Check")),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text("Learner")),
                  DataColumn(label: Text("Points")),
                  DataColumn(label: Text("Biology")),
                  DataColumn(label: Text("Physics")),
                ],
                rows: List.generate(7, (index) {
                  return DataRow(
                    cells: [
                      DataCell(Text("Sritapurnya")),
                      DataCell(Text("10.0")),
                      DataCell(Text("7.0")),
                      DataCell(Text("7.0")),
                    ],
                  );
                }),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecheckList()),
                  );
                },
                child: Text("Recheck List"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DefaultersList(),
                    ),
                  );
                },
                child: Text("Defaulter List"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Give Assignments Tab
  Widget _buildGiveAssignmentsTab() {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: Column(
            children: [
              Icon(Icons.upload, size: 50),
              TextButton(onPressed: () {}, child: Text("Upload Assignment")),
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text("Ongoing Assignment")),
                  DataColumn(label: Text("Due Date")),
                  DataColumn(label: Text("Responses")),
                ],
                rows: [
                  _buildAssignmentRow("Physics", "18th Sept", "68"),
                  _buildAssignmentRow("Chemistry", "18th Sept", "16"),
                  _buildAssignmentRow("Biology", "19th Sept", "10"),
                  _buildAssignmentRow("Maths", "19th Sept", "20"),
                  _buildAssignmentRow("History", "19th Sept", "25"),
                  _buildAssignmentRow("EVS", "19th Sept", "14"),
                  _buildAssignmentRow("UHV", "18th Sept", "16"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Function to create assignment row
  DataRow _buildAssignmentRow(
    String subject,
    String dueDate,
    String responses,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(subject)),
        DataCell(Text(dueDate)),
        DataCell(Text(responses)),
      ],
    );
  }
}
