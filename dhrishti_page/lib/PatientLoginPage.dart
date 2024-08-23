import 'package:dhrishti_page/common_methods.dart';
import 'package:dhrishti_page/dataClass.dart';
import 'package:dhrishti_page/loading_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  CommonMethods cMeethods = CommonMethods();
  DataClass data = DataClass();
  LoginValidation() {
    if (!email_controller.text.contains("@")) {
      cMeethods.displaysnackBar("Please write valid email", context);
    } else if (password_controller.text.trim().length < 6) {
      cMeethods.displaysnackBar(
          "Password Must be 6 or more characters", context);
    } else {
      loginuser();
    }
  }

  loginuser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDialog(massagetext: "logging in your Account. . ."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Blue box with logo and text
          Container(
            color: Color(0xFF1224A5),
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images.png', // Replace with your image asset
                  height: 100.0,
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
          SizedBox(height: 40.0),
          // Username field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username:',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1224A5)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1224A5)),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          // Password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Password:',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1224A5)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1224A5)),
                ),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 40.0),
          // Next button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1224A5),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            ),
            onPressed: () {
              // Handle next button press
            },
            child: Text(
              'NEXT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
