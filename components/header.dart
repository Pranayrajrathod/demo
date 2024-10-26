import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.only(top: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'URBAN HERO',
              style: TextStyle(
                fontSize: 24, // Adjust font size as needed
                color: Colors.green, // Adjust color as needed
              ),
            ),
            SizedBox(height: 8), // Add spacing between texts
            Text(
              'Sustainable Cities and Communities',
              style: TextStyle(
                fontSize: 16, // Adjust font size as needed
                color: Colors.grey, // Adjust color as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}