import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dhrishti_page/data_json/code.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "5fdad42f5334f1d95af6b7e01b41ae8a0bb0f7e4",
      appId: "com.example.dhrishti_page",
      projectId: "aravind-eye-3845e",
      messagingSenderId: '',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final jsonUploader = JsonUploader();
              await jsonUploader.uploadJsonFiles('assets/data_main.json');
            },
            child: Text('Upload JSON Data'),
          ),
        ),
      ),
    );
  }
}
