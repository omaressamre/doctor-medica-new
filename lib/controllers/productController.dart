import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:medica/models/product_model.dart';
import 'package:medica/services/firestore_db.dart';


class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}

//   Stream<List<productCard>> getAllProducts() => FirebaseFirestore.instance
//       .collection(collection)
//       .snapshots()
//       .map((query) =>
//           query.docs.map((doc) => productCard.fromJson(doc.data())).toList());

