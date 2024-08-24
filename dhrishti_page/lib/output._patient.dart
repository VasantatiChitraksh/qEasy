import 'dart:math';

import 'package:flutter/material.dart';

class OutputPatient extends StatelessWidget {
  final String patientName; // Patient's name as input
  final int referenceValue = 83;
  final List<int> diff = [3, 5]; // Diff values for main center and community center
  final List<int> Li = [45, 65, 56, 47, 48]; // Waiting times

  OutputPatient({Key? key, required this.patientName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create an instance of Random
    final random = Random();

    // Generate a random index
    final int randomIndex = random.nextInt(Li.length);

    // Get the waiting time using the random index
    final int waitingTime = Li[randomIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images.png', // Replace with your logo path
              height: 100,
            ),
            SizedBox(height: 20),

            // Title
            Container(
              width: double.infinity,
              color: Color(0xFF1224A5),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              alignment: Alignment.center,
              child: Text(
                'ARAVIND EYE CARE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),

            // Estimated Waiting Time
            Text(
              'YOUR ESTIMATED WAITING TIME IS:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            Text(
              '$waitingTime minutes', // Display the waiting time
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1224A5),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
