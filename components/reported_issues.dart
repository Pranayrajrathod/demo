import 'package:flutter/material.dart';

class ReportedIssues extends StatelessWidget {
  final List<String> issues;

  const ReportedIssues({super.key, required this.issues});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reported Issues',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            for (var issue in issues)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(issue),
              ),
          ],
        ),
      ),
    );
  }
}