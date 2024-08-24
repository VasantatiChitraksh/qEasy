import 'package:dhrishti_page/DoctorLogin.dart';
import 'package:dhrishti_page/Homepage.dart';
import 'package:dhrishti_page/PatientLoginPage.dart';
import 'package:dhrishti_page/addpatient.dart';
import 'package:dhrishti_page/docLocation.dart';
import 'package:dhrishti_page/firebase_options.dart';
import 'package:dhrishti_page/location.dart';
import 'package:dhrishti_page/outptu_doctor.dart';
import 'package:dhrishti_page/output._patient.dart';
import 'package:dhrishti_page/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } finally {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/author',
      //initialRoute: '/patientLogin',
      routes: {
        '/author': (context) => HomePage(),
        '/doctorLogin': (context) => DoctorLogin(),
        '/patientLogin': (context) => LoginPage(),
        '/location': (context) => Location(),
        '/Doclocation': (context) => DocLocation(),
        '/register': (context) => Registrations(),
        '/patient': (context) => OutputPatient(),
        '/doctor': (context) => OutputDoctor(),
        '/addPatient': (context) => AddPatient(),
      },
    );
  }
}
