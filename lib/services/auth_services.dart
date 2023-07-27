import 'package:ecanteen/ui/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // static Future<void> signInAnonymous() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser firebaseUser = result.user;

  //     return firebaseUser;
  //   } catch (e) {
  //     print(e.toString());

  //     return null;
  //   }
  // }

  Future<void> signUp(String email, String password, String Cpassword) async {
    // AuthResult result = await _auth.createUserWithEmailAndPassword(
    //     email: email, password: password);
    // FirebaseUser firebaseUser = result.user;

    // return firebaseUser;
    if (password != Cpassword) {
      return Get.snackbar("Error", "Password tidak sama",
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      try {
        final user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        Get.to(() => const AddressPage());
      } catch (error) {
        print("errornya : ${error.message}");
        return Get.snackbar("Error", error.message,
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    // AuthResult result = await _auth.createUserWithEmailAndPassword(
    //     email: email, password: password);
    // FirebaseUser firebaseUser = result.user;

    // return firebaseUser;

    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(const MainPage());
    } catch (error) {
      print(error.toString());
      return Get.snackbar("Error", error.message,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> showMessage(String error) async {
    return Get.snackbar("Error", error,
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
