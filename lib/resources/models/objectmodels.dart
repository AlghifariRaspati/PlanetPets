import 'package:cloud_firestore/cloud_firestore.dart';

class ObjectModels {
  String id;
  final String image;
  final String title;
  final int price;
  final String description;
  final String category;
  final String store;

  ObjectModels({
    this.id = '',
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.store,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': "",
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'store': store
      };
}
