import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenguardians/utils/class.dart';

class TrackIssuesPage extends StatelessWidget {
  final List<Issue> issues = [
    Issue(
      issueNumber: 'Issue No. 1',
      description: 'Plastic waste near the park.',
      status: 'In Progress',
      imagePath: 'path/to/image1.jpg', // Update with your image path
    ),
    Issue(
      issueNumber: 'Issue No. 2',
      description: 'Organic waste not collected on time.',
      status: 'Resolved',
      imagePath: 'path/to/image2.jpg', // Update with your image path
    ),
    Issue(
      issueNumber: 'Issue No. 3',
      description: 'Metal waste in the river.',
      status: 'Pending',
      imagePath: 'path/to/image3.jpg', // Update with your image path
    ),
    // Add more issues as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Your Issues"),
        backgroundColor: Colors.yellowAccent,
      ),
      body: ListView.builder(
        itemCount: issues.length,
        itemBuilder: (context, index) {
          final issue = issues[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(8.0),
              title: Row(
                children: [
                  // Display image with fixed size
                  Container(
                    width: 80, // Fixed width
                    height: 80, // Fixed height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey), // Optional border
                      image: DecorationImage(
                        image: FileImage(File(issue.imagePath)), // Use FileImage for local files
                        fit: BoxFit.cover, // Cover to fill the container
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Space between image and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          issue.issueNumber,
                          style: TextStyle(fontWeight: FontWeight.bold), // Bold for issue number
                        ),
                        Text(issue.description),
                        SizedBox(height: 5),
                        Text(
                          'Status: ${issue.status}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: issue.status == 'Resolved' ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}