import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String? docId;

  Database({this.docId});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamCatalog() {
    return firestore.collection('Catalog').snapshots();
  }
}
