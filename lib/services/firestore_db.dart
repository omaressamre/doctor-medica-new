import 'package:cloud_firestore/cloud_firestore.dart';
// import 'doctor_model'
import 'package:medica/models/product_model.dart';

import '../view/widgets/doctor_model.dart';

class FirestoreDB {
  // Initialise Firebase Cloud Firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Doctor>> getAllDoctors() {
    return _firebaseFirestore
        .collection('doctors')
        .orderBy('displayName')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Doctor.fromSnapshot(doc)).toList();
    });
  }
}
