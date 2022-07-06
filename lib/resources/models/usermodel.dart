import 'package:cloud_firestore/cloud_firestore.dart';

class UserModels {
  final String email;
  final String password;
  final String role;
  final String username;
  final String whatsapp;

  final String storename;

  UserModels({
    required this.email,
    required this.password,
    required this.storename,
    required this.username,
    required this.whatsapp,
    required this.role,
  });

  factory UserModels.formData(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModels(
      email: doc.data()!['email'],
      password: doc.data()!['password'],
      username: doc.data()!['username'],
      whatsapp: doc.data()!['wa'],
      storename: doc.data()!['store'],
      role: doc.data()!['role'],
    );
  }
}
