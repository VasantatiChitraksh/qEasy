import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'location.dart'; // Assuming this is your location class

class OutputPatient extends StatelessWidget {
  final String patientName; // Patient's name as input
  final Location l = Location(); // Location class instance
  final int referenceValue = 83;
  final List<int> diff = [
    3,
    5
  ];
   // Diff values for main center and community center

  OutputPatient({Key? key, required this.patientName}) : super(key: key);
  
  Future<int> _calculateWaitingTime() async {
    print(patientName);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('live_patients')
        .where('username', isEqualTo: patientName)
        .limit(1)
        .get();

    // Get the currentUid from the query result
    int currentUid = querySnapshot.docs.first['uid'];

    // Step 2: Fetch the first document in the live_patients collection
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('live_patients')
        .orderBy('uid')
        .limit(1)
        .get();

    // Get the first UID
    int firstUid = snapshot.docs.first['uid'];

    // Step 3: Calculate the difference between the currentUid and firstUid
    int difference = currentUid - firstUid;

    // Step 4: Calculate the waiting time based on the center type
    int waitingTime;
    if (l.type == 0) {
      waitingTime = referenceValue + (difference * diff[1]);
    } else {
      waitingTime = referenceValue + (difference * diff[0]);
    }

    return waitingTime;
  }

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

            // Dynamic Waiting Time
            FutureBuilder<int> async(
              future: await _calculateWaitingTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  int waitingTime = snapshot.data ?? 0;
                  return Text(
                    '$waitingTime Mins',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1224A5),
                    ),
                    textAlign: TextAlign.center,
                  );
                }
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
