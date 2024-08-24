import 'package:dhrishti_page/counter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPatient extends StatelessWidget {
  TextEditingController name_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            Text(
              'ARAVIND EYE CARE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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

            // Username Field
            TextField(
              controller: name_controller,
              decoration: InputDecoration(
                labelText: 'Patient Name:',
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Color(0xFF1224A5),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),

            // Next Button
            ElevatedButton(
              onPressed: () async {
                UserRegistration userRegistration =
                    UserRegistration(FirebaseFirestore.instance);

                await userRegistration.registerNewUser(name_controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('User registered successfully.')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1224A5),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'NEXT',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
