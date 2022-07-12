import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String? docId;
  final String? store;

  Database({this.docId, this.store});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamCatalog() {
    return firestore
        .collection('Catalog')
        .where('store', isEqualTo: store)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamFavorite() {
    return firestore
        .collection('Favorite')
        .where('store', isEqualTo: store)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamUser() {
    return firestore.collection('User').snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> docUser() {
    return firestore.collection('User').doc(docId).snapshots();
  }

  Future updateCatalog({required var data}) async {
    try {
      await firestore.collection('Catalog').doc(docId).update(data);
    } catch (e) {
      print("Upload Gagal");
    }
  }

  Future deleteCatalog({required var data}) async {
    try {
      await firestore.collection('Catalog').doc(docId).delete();
    } catch (e) {
      print("Upload Gagal");
    }
  }

  Future createCatalog({required var data}) async {
    try {
      return await firestore.collection('Catalog').add(data);
    } catch (e) {
      print("Upload Gagal");
    }
  }
}
