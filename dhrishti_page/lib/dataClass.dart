import 'package:cloud_firestore/cloud_firestore.dart';

class DataClass {
  static String username = "";
  static String password = "";
  static int role = 0;
  static bool access = false;

  static void addUsername(String name) async {
    username = name;
    CollectionReference passwords =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await passwords.get();
    for (var doc in querySnapshot.docs) {
      if (doc['username'] == username) {
        password = doc['password'];
        access = true;
        role = doc['role'];
      }
    }
  }
}
