import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String name, String email,String password,String role) async {
    try {
      await _firestore.collection('UsersTbl').add({
        'UserName': name,
        'UserEmail': email,
        'UserPassword': password,
        'UserRole': role,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("✅ User added and collection auto-created!");
    } catch (e) {
      print("❌ Error: $e");
    }
  }
}
