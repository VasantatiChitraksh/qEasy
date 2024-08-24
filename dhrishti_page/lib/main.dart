import 'package:dhrishti_page/PatientLoginPage.dart';
import 'package:dhrishti_page/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
<<<<<<< HEAD
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } finally {
    runApp(MyApp());
  }
=======
  runApp(MyApp());
>>>>>>> parent of 1f0c39e (Update)
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: '/patientLogin',
      routes: {
        '/doctorLogin': (context) => DoctorLoginPage(),
        '/patientLogin': (context) => LoginPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
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
                Navigator.pushNamed(context, '/doctorLogin');
              },
              child: Text(
                'Doctor Login',
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
              onPressed: () {
                // Navigate to Patient Login Page
                Navigator.pushNamed(context, '/patientLogin');
              },
              child: Text(
                'Patient Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Doctor Login Page
class DoctorLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Login'),
      ),
      body: Center(
        child: Text(
          'Doctor Login Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

// Dummy Patient Login Page
class PatientLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Login'),
      ),
      body: Center(
        child: Text(
          'Patient Login Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
