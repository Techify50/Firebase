import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class Services {
  static Future<void> add(String x, String y) async {
    await firebaseFirestore
        .collection('notes')
        .add({'title': x, 'details': y}).whenComplete(() => print('success'));
  }

  static Future<void> delete(String id) async {
    await firebaseFirestore.collection('notes').doc(id).delete();
  }
}
