import 'package:cloud_firestore/cloud_firestore.dart';

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
}
