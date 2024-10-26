import 'package:flutter/material.dart';

class ProfilePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Profile'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Username: manager456'),
          Text('Name: Rajesh'),
          Text('Email: dappuriRajkumarh@example.com'),
          Text('Phone: +91 934 567 8901'),
          Text('Address: 456 Worker Ave, City, India'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}