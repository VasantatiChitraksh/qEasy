import 'package:cloud_firestore/cloud_firestore.dart';

class PatientRemoval {
  final FirebaseFirestore _firestore;

  PatientRemoval(this._firestore);

  Future<void> removeFirstPatient() async {
    final collectionRef = _firestore.collection('live_patients');

    try {
      // Get the document with the smallest uid (the first one added)
      final QuerySnapshot firstDocSnapshot = await collectionRef
          .orderBy('uid')
          .limit(1)
          .get();

      if (firstDocSnapshot.docs.isNotEmpty) {
        final firstDoc = firstDocSnapshot.docs.first;

        // Remove the document from Firestore
        await collectionRef.doc(firstDoc.id).delete();

        print('Patient with uid: ${firstDoc['uid']} removed.');
      } else {
        print('No patients found to remove.');
      }
    } catch (e) {
      print('Error removing patient: $e');
      rethrow;
    }
  }
}
