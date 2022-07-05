import 'package:cloud_firestore/cloud_firestore.dart';

class UserModels {
  final String name;
  final String whatsapp;
  final String userid;
  final String role;

  UserModels({
    required this.name,
    required this.whatsapp,
    required this.userid,
    required this.role,
  });

  factory UserModels.formData(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModels(
      name: doc.data()!['name'],
      whatsapp: doc.data()!['whatsapp'],
      userid: doc.data()!['userid'],
      role: doc.data()!['role'],
    );
  }
}
