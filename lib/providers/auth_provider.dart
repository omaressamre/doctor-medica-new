// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medica/allConstants/firestore_constants.dart';
import 'package:medica/doctor/doctor_getstarted.dart';
import 'package:medica/doctor/doctor_home.dart';
import 'package:medica/doctor/doctor_login.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medica/allConstants/all_constants.dart';
import 'package:medica/models/chat_user.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCanceled,
}

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final SharedPreferences prefs;

  Status _status = Status.uninitialized;

  Status get status => _status;

  AuthProvider(
      {required this.googleSignIn,
      required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.prefs});

  String? getFirebaseUserId() {
    return prefs.getString(FirestoreConstants.id);
  }

  Future<bool> isLoggedIn() async {
    bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn &&
        prefs.getString(FirestoreConstants.id)?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> SignOut() async {
    _status = Status.uninitialized;
    await firebaseAuth.signOut();
    prefs.setBool(k_dockeepMeLoggedIn, false);
    Get.offAll(() => doctor_getstarted());
  }

  Future<bool> handleDoctorGoogleSignIn() async {
    _status = Status.authenticating;
    notifyListeners();

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      User? firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      if (firebaseUser != null) {
        final QuerySnapshot result = await firebaseFirestore
            .collection(FirestoreConstants.pathDoctorCollection)
            .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
            .get();
        final List<DocumentSnapshot> document = result.docs;
        if (document.isEmpty) {
          firebaseFirestore
              .collection(FirestoreConstants.pathDoctorCollection)
              .doc(firebaseUser.uid)
              .set({
            FirestoreConstants.displayName: firebaseUser.displayName,
            FirestoreConstants.photoUrl: firebaseUser.photoURL,
            FirestoreConstants.id: firebaseUser.uid,
            "createdAt: ": DateTime.now().millisecondsSinceEpoch.toString(),
            FirestoreConstants.chattingWith: null
          });

          User? currentUser = firebaseUser;
          await prefs.setString(FirestoreConstants.id, currentUser.uid);
          await prefs.setString(
              FirestoreConstants.displayName, currentUser.displayName ?? "");
          await prefs.setString(
              FirestoreConstants.photoUrl, currentUser.photoURL ?? "");
          await prefs.setString(
              FirestoreConstants.phone, currentUser.phoneNumber ?? "");
        } else {
          DocumentSnapshot documentSnapshot = document[0];
          ChatUser userChat = ChatUser.fromDocument(documentSnapshot);
          await prefs.setString(FirestoreConstants.id, userChat.id);
          await prefs.setString(
              FirestoreConstants.displayName, userChat.displayName);
          await prefs.setString(
              FirestoreConstants.speciality, userChat.speciality);
          await prefs.setString(FirestoreConstants.phone, userChat.phoneNumber);
        }
        Get.to(() => doctor_home.withuser(
            prefs.getString(FirestoreConstants.displayName) as String));
        _status = Status.authenticated;
        notifyListeners();
        return true;
      } else {
        _status = Status.authenticateError;
        notifyListeners();
        return false;
      }
    } else {
      _status = Status.authenticateCanceled;
      notifyListeners();
      return false;
    }
  }

  Future<User?> signInDoctorUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      User? firebaseUser = user;
      if (firebaseUser != null) {
        final QuerySnapshot result = await firebaseFirestore
            .collection(FirestoreConstants.pathDoctorCollection)
            .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
            .get();
        final List<DocumentSnapshot> document = result.docs;
        DocumentSnapshot documentSnapshot = document[0];
        ChatUser userChat = ChatUser.fromDocument(documentSnapshot);
        await prefs.setString(
            FirestoreConstants.displayName, firebaseUser.displayName as String);
        await prefs.setString(FirestoreConstants.id, userChat.id);
        await prefs.setString(
            userChat.displayName, FirestoreConstants.displayName);
        await prefs.setString(
            FirestoreConstants.speciality, userChat.speciality);
        await prefs.setString(FirestoreConstants.phone, userChat.phoneNumber);
        userChat.displayName = user?.displayName as String;
        print(userChat.displayName);
      }
      print(prefs.getString(FirestoreConstants.id));
      print(prefs.getString(FirestoreConstants.displayName));
      Get.offAll(() => doctor_home
          .withuser(prefs.getString(FirestoreConstants.displayName) as String));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar(
          'Error login account',
          'No user found for that email.',
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        Get.snackbar(
          'Error login account',
          'Wrong Password provided',
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }

    return user;
  }

  Future<User?> registerDoctorUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String speciality,
    required dynamic experience,
    required dynamic patients,
    required dynamic certificates,
    required dynamic lat,
    required dynamic long,
    required String photoUrl,
  }) async {
    User? user;

    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: name, photoURL: photoUrl);
      await user.reload();
      user = firebaseAuth.currentUser;
      firebaseFirestore
          .collection(FirestoreConstants.pathDoctorCollection)
          .doc(user!.uid)
          .set({
        FirestoreConstants.id: user.uid,
        FirestoreConstants.email: user.email,
        FirestoreConstants.pass: password,
        FirestoreConstants.phone: phone,
        FirestoreConstants.experience: experience,
        FirestoreConstants.patients: patients,
        FirestoreConstants.certificates: certificates,
        FirestoreConstants.lat: lat,
        FirestoreConstants.long: long,
        FirestoreConstants.speciality: speciality,
        FirestoreConstants.photoUrl: user.photoURL,
        FirestoreConstants.displayName: user.displayName,
        "createdAt: ": DateTime.now().millisecondsSinceEpoch.toString(),
        FirestoreConstants.chattingWith: null
      });
      User? currentUser = user;
      await prefs.setString(FirestoreConstants.id, currentUser.uid);
      await prefs.setString(
          FirestoreConstants.displayName, currentUser.displayName ?? "");
      await prefs.setString(
          FirestoreConstants.photoUrl, currentUser.photoURL ?? "");
      await prefs.setString(
          FirestoreConstants.phone, currentUser.phoneNumber ?? "");
      await prefs.setString(FirestoreConstants.speciality, speciality);
      await prefs.setString(FirestoreConstants.email, email);
      await prefs.setString(FirestoreConstants.certificates, certificates);
      await prefs.setString(FirestoreConstants.experience, experience);
      await prefs.setString(FirestoreConstants.lat, lat);
      await prefs.setString(FirestoreConstants.long, long);
      await prefs.setString(FirestoreConstants.patients, patients);
      await prefs.setString(FirestoreConstants.pass, password);
      print(prefs.getString(FirestoreConstants.id));
      print(prefs.getString(FirestoreConstants.displayName));

      Get.to(() => doctor_login());
      // Get.to(() => doctor_home
      //     .withuser(prefs.getString(FirestoreConstants.displayName) as String));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar(
          'Error login account',
          'The password provided is too weak.',
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
          'Error login account',
          'The account already exists for that email.',
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
