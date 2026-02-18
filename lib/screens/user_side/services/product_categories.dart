import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCategories() {
    return _db.collection('categories').snapshots();
  }

  Stream<QuerySnapshot> getProducts() {
    return _db.collection('products').snapshots();
  }

  Stream<QuerySnapshot> getProductsByCategory(String categoryName) {
    return _db
        .collection('products')
        .where('category', isEqualTo: categoryName)
        .snapshots();
  }

  Stream<QuerySnapshot> getCart() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return _db.collection("users").doc(uid).collection("cart").snapshots();
  }
}
