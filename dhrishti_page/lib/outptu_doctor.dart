import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'location.dart'; // Assuming this is your location class

class PatientDropdown extends StatefulWidget {
  @override
  _PatientDropdownState createState() => _PatientDropdownState();
}

class _PatientDropdownState extends State<PatientDropdown> {
  String? _selectedPatient;
  List<String> _patients = [];
  int _waitingTime = 0;

  @override
  void initState() {
    super.initState();
    _fetchPatients();
  }

  Future<void> _fetchPatients() async {
    // Fetch all documents from the live_patients collection
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('live_patients').get();

    // Extract the 'username' field from each document and store in _patients list
    List<String> patientList =
        snapshot.docs.map((doc) => doc['username'] as String).toList();

    setState(() {
      _patients = patientList;
      if (_patients.isNotEmpty) {
        _selectedPatient = _patients[0]; // Set the first patient as default
        _calculateWaitingTime(); // Calculate waiting time for the first patient
      }
    });
  }

  Future<void> _calculateWaitingTime() async {
    if (_selectedPatient == null) return;

    // Fetch the UID for the selected patient
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('live_patients')
        .where('username', isEqualTo: _selectedPatient)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      setState(() {
        _waitingTime = 0; // No patient found
      });
      return;
    }

    // Get the currentUid from the query result
    int currentUid = querySnapshot.docs.first['uid'];

    // Fetch the first document in the live_patients collection
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('live_patients')
        .orderBy('uid')
        .limit(1)
        .get();

    // Get the first UID
    int firstUid = snapshot.docs.first['uid'];

    // Calculate the difference between the currentUid and firstUid
    int difference = currentUid - firstUid;

    // Assuming Location l is provided externally or defined similarly as in OutputPatient class
    Location l = Location();
    int referenceValue = 83;
    List<int> diff = [3, 5]; // Diff values for main center and community center

    // Calculate the waiting time based on the center type
    int waitingTime;
    if (l.type == 0) {
      waitingTime = referenceValue + (difference * diff[1]);
    } else {
      waitingTime = referenceValue + (difference * diff[0]);
    }

    setState(() {
      _waitingTime = waitingTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Patient'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _patients.isEmpty
                ? CircularProgressIndicator()
                : DropdownButton<String>(
                    value: _selectedPatient,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPatient = newValue!;
                        _calculateWaitingTime(); // Recalculate waiting time on selection change
                      });
                    },
                    items:
                        _patients.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
            SizedBox(height: 20),
            Text(
              'Waiting Time: $_waitingTime minutes',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
