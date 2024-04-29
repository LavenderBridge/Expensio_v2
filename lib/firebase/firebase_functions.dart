import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/Firestore_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  void setPrefs(bool status, String uid) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("isLoggedIn", status);
    _prefs.setString("uid", uid);
    print("Pref set to ${status} successfully");
  }

  // Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> email_signin(String emailAddress, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) {
            print("Collectiondata_login.dart: ${value.user!.uid}");
        setPrefs(true, value.user!.uid);
        FirestoreController storageController = Get.put(FirestoreController());
        storageController.Uid.value = value.user!.uid;
        storageController.initInstance();
        Get.snackbar(
          'Success',
          'User signed in',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ConfigClass.incomeGreen,
          colorText: Colors.white,
          borderRadius: 0,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          snackStyle: SnackStyle.GROUNDED,
          maxWidth: Get.width,
          forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
          reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
        );
        Get.offAllNamed('/all');
      }); } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error: ${e.code}',
        'Please check your credentials and try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ConfigClass.expenseRed,
        colorText: Colors.white,
        borderRadius: 0,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        snackStyle: SnackStyle.GROUNDED,
        maxWidth: Get.width,
        forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
        reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  Future<void> new_user(String emailAddress, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((value) => {
                Get.snackbar(
                  'Success',
                  'New user created successfully. Logging you in',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: ConfigClass.incomeGreen,
                  colorText: Colors.white,
                  borderRadius: 0,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  snackStyle: SnackStyle.GROUNDED,
                  maxWidth: Get.width,
                  forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
                  reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
                ),
                Future.delayed(Duration(seconds: 1)),
                email_signin(emailAddress, password)
              });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error: ${e.code}',
        '${e.message}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ConfigClass.expenseRed,
        colorText: Colors.white,
        borderRadius: 0,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        snackStyle: SnackStyle.GROUNDED,
        maxWidth: Get.width,
        forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
        reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut().then((value) => {
          setPrefs(false, ""),
          Get.snackbar(
            'Success',
            'User successfully signed out',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ConfigClass.incomeGreen,
            colorText: Colors.white,
            borderRadius: 0,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            snackStyle: SnackStyle.GROUNDED,
            maxWidth: Get.width,
            forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
            reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
          ),
        });
  }
}
