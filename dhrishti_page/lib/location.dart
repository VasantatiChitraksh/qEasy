import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<Location> {
  String? selectedlocation;
  String? selectedType;

  // Sample data for dropdowns
  List<String> location = ['Tirupati', 'Madurai', 'Salem'];
  List<String>  Type = ['Main', 'Community'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aravind Eye Care'),
        backgroundColor: Color(0xFF1224A5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images.png',
              height: 100,
            ),
            SizedBox(height: 20),

            // Title
            Text(
              'ARAVIND EYE CARE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                backgroundColor: Color(0xFF1224A5),
              ),
            ),
            SizedBox(height: 40),

            // Date Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Location:',
                filled: true,
                fillColor: Colors.grey[300],
              ),
              value: selectedlocation,
              items: location.map((location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedlocation = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Time Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Type:',
                filled: true,
                fillColor: Colors.grey[300],
              ),
              value: selectedType,
              items: Type.map((Type) {
                return DropdownMenuItem<String>(
                  value: Type,
                  child: Text(Type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),
            SizedBox(height: 40),

            // Next Button
            ElevatedButton(
              onPressed: () {
                if(selectedlocation != null && selectedType !=null){
                Navigator.pushNamed(context, '/patient');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1224A5),
              ),
              child: Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}