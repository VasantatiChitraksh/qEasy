import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JsonUploader {
  Future<void> uploadJsonFiles(String filepath) async {
    String file = filepath;
    try {
      final jsonData = await rootBundle.loadString(file);

      final data = List<Map<String, dynamic>>.from(jsonDecode(jsonData));

      final collectionRef =
          FirebaseFirestore.instance.collection('your_collection_name');

      for (final item in data) {
        await collectionRef.add(item);
      }

      print('JSON data uploaded successfully!');
    } catch (e) {
      print('Error uploading JSON data: $e');
    }
  }
}
