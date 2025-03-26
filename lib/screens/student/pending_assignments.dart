import 'package:flutter/material.dart';

class PendingAssignments extends StatelessWidget {
  const PendingAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Pending Assignments", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          SizedBox(height: 10),

          Expanded(
            child: ListView(
              children: [
                _assignmentItem("Biology - 19th March"),
                _assignmentItem("Physics - 12th March"),
                _assignmentItem("Maths - 20th March"),
                _assignmentItem("Chemistry - 18th March"),
                _assignmentItem("History - 15th March"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Function for Pending Assignment Item
  Widget _assignmentItem(String title) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.assignment),
      ),
    );
  }
}
