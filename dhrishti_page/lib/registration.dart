import 'package:dhrishti_page/counter.dart';
import 'package:dhrishti_page/delete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Registrations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Section
            Container(
              color: Color(0xFF1224A5),
              width: double.infinity,
              height: 300.0, // Adjust height as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment(0, 0.1),
                    child: Image.asset(
                      'assets/images.png',
                      height: 100.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'ARAVIND EYE CARE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.0),
            // Doctor Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1224A5),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              onPressed: () {
                // Navigate to Doctor Login Page
                Navigator.pushNamed(context, '/addPatient');
              },
              child: Text(
                'Register Patient',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            // Patient Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1224A5),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              onPressed: () async {
                // Ensure Firebase is initialized
                await Firebase.initializeApp();

                // Create an instance of UserRegistration with Firestore
                PatientRemoval remove =
                    PatientRemoval(FirebaseFirestore.instance);

                // Register the new user
                try {
                  await remove.removeFirstPatient();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User removed successfully.')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error removing user: $e')),
                  );
                }
              },
              child: Text(
                'Discharge Patient',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
