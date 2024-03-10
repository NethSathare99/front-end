import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userAddress;

  ProfileScreen({
    required this.userName,
    required this.userEmail,
    required this.userAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Details',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name: $userName',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: $userEmail',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Address: $userAddress',
              style: TextStyle(fontSize: 18.0,),
            ),
          ],
        ),
      ),
    );
  }
}
