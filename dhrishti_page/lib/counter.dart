import 'package:cloud_firestore/cloud_firestore.dart';

class UserRegistration {
  final FirebaseFirestore _firestore;

  UserRegistration(this._firestore);

  Future<int> registerNewUser(String username) async {
    final collectionRef = _firestore.collection('live_patients');

    try {
      // Get the latest document by sorting by uid in descending order
      final QuerySnapshot latestDocSnapshot =
          await collectionRef.orderBy('uid', descending: true).limit(1).get();

      int newUid = 1; // Start from 1 if no documents are found

      if (latestDocSnapshot.docs.isNotEmpty) {
        final latestDoc = latestDocSnapshot.docs.first;
        final int latestUid = latestDoc['uid'] as int;

        // Increment the latest uid
        newUid = latestUid + 1;
      }

      // Create a new document with the incremented uid
      await collectionRef.add({
        'uid': newUid,
        'username': username,
        // Add other fields as needed
      });

      print('User $username registered with uid: $newUid');
      return newUid; // Return the new uid
    } catch (e) {
      print('Error registering user: $e');
      rethrow;
    }
  }
}
