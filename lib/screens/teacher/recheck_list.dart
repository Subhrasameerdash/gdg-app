import 'package:flutter/material.dart';

class RecheckList extends StatelessWidget {
  const RecheckList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recheck List")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the class, to check the recheck list",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(9, (index) {
                return ElevatedButton(
                  onPressed: () {},
                  child: Text("Sec ${String.fromCharCode(65 + index)}"),
                );
              }),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Search"),
              ),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              columnWidths: {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Name", textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Subject", textAlign: TextAlign.center),
                    ),
                  ],
                ),
                for (int i = 1; i <= 8; i++)
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("$i", textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("", textAlign: TextAlign.center),
                    ),
                  ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
