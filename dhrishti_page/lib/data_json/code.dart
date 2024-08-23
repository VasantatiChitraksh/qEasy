import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JsonUploader {
  Future<void> uploadJsonFiles(String filepath) async {
    try {
      final jsonData = await rootBundle.loadString(filepath);

      final data = List<Map<String, dynamic>>.from(jsonDecode(jsonData));

      final collectionRef = FirebaseFirestore.instance.collection('examine');

      for (final item in data) {
        final nestedData = item;

        final avgDialation = nestedData['avg_dialation'] as double;
        final avgRegTime = nestedData['avg_reg_time'] as int;
        final avgInvestigation = nestedData['avg_investigation'] as String;
        final avgExamine = nestedData['avg_examine'] as double;
        final avgRefraction = nestedData['avg_refraction'] as double;

        // ... other nested fields and data processing

        await collectionRef.add({
          'avg_dialation': avgDialation,
          'avg_reg_time': avgRegTime,
          'avg_investigation': avgInvestigation,
          'avg_examine': avgExamine,
          'avg_refraction': avgRefraction,
        });
      }

      print('JSON data uploaded successfully!');
    } catch (e) {
      print('Error uploading JSON data: $e');
    }
  }
}


