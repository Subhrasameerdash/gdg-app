import 'package:flutter/material.dart';

class PendingAssignments extends StatelessWidget {
  const PendingAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "Pending Assignments",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              children: [
                _assignmentItem(context, "Biology - 19th March"),
                _assignmentItem(context, "Physics - 12th March"),
                _assignmentItem(context, "Maths - 20th March"),
                _assignmentItem(context, "Chemistry - 18th March"),
                _assignmentItem(context, "History - 15th March"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Function for Pending Assignment Item with "Submit Assignment" Button
  Widget _assignmentItem(BuildContext context, String title) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to upload screen or trigger upload function
            _submitAssignment(context, title);
          },
          child: const Text("Submit"),
        ),
      ),
    );
  }

  // Function to handle assignment submission
  void _submitAssignment(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Submitting: $title")),
    );

    // You can navigate to the upload screen like this:
    // Navigator.push(context, MaterialPageRoute(builder: (context) => UploadAssignmentScreen()));

    // Or call the upload function directly
  }
}
