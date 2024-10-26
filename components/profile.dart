import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String username;
  final String role;

  const Profile({Key? key, required this.username, required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = role == 'manager' ? 'Rajesh' : 'Rajkumar';
    String email = role == 'manager'
        ? 'rajesh.doe@example.com'
        : 'dappuriRajkumarh@example.com';
    String phone = role == 'manager' ? '+91 934 567 8900' : '+91 934 567 8901';
    String address = role == 'manager'
        ? '123 Manager St, City, India'
        : '456 Worker Ave, City, India';

    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            role == 'manager' ? 'Manager Profile' : 'Manager Profile',
            style: TextStyle(
              fontSize: 18,
              color: Colors.green, // Adjust color as needed
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10), // Add spacing between elements
          Row(
            children: [
              Text(
                'Username:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(username),
            ],
          ),
          Row(
            children: [
              Text(
                'Name:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(name),
            ],
          ),
          Row(
            children: [
              Text(
                'Email:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(email),
            ],
          ),
          Row(
            children: [
              Text(
                'Phone:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(phone),
            ],
          ),
          Row(
            children: [
              Text(
                'Address:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Expanded(child: Text(address)), // Allow text to wrap
            ],
          ),
        ],
      ),
    );
  }
}