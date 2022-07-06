import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogModels {
  final String docId;
  final String image;
  final String title;
  final int price;
  final String description;
  final String category;
  final String store;

  CatalogModels({
    required this.docId,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.store,
  });

  factory CatalogModels.formData(DocumentSnapshot<Map<String, dynamic>> doc) {
    return CatalogModels(
      docId: doc.id,
      image: doc.data()!['image'],
      title: doc.data()!['title'],
      price: doc.data()!['price'],
      description: doc.data()!['description'],
      category: doc.data()!['category'],
      store: doc.data()!['store'],
    );
  }
}
