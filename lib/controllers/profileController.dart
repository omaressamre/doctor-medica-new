import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class profileController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      print("image_path save");
      //usersImageAdd(selectedImagePath.value, FirebaseAuth.instance.currentUser?.uid);

    } else {
      Get.snackbar("Error!", "Photo Not Selected",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white);
    }
  }

  fireStore_Get_ImagePath() {
    FirebaseFirestore.instance
        .collection("usersImages")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc != null) {
          if (FirebaseAuth.instance.currentUser?.uid == doc["uid"]) {
            selectedImagePath.value = doc["image_path"];
            print("1111111111111111111111111111111");
          } else {
            selectedImagePath.value = '';
            print("0000000000000000000000000000000");
          }
        }
      });
    });
  }

  void deleteMemoryImage() {
    selectedImagePath.value = '';
    FirebaseFirestore.instance
        .collection("usersImages")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc != null &&
            FirebaseAuth.instance.currentUser?.uid == doc["uid"]) {
          doc.reference.delete();
        }
      });
    });
  }
}
