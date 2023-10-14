import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  var isLoading = false;

  User? getUser() {
    return _auth.currentUser;
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      isLoading = true;
      await Future.delayed(const Duration(seconds: 1));
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      isLoading = false;
      return "Success";
    } catch (e) {
      debugPrint(e.toString() + "@@");
    }
    return "Empty message";
  }

  Future<String> register(
      {required String email, required String password}) async {
    try {
      isLoading = true;
      await Future.delayed(const Duration(seconds: 1));
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isLoading = false;
      return "Success";
    } catch (e) {
      debugPrint(e.toString());
    }
    return "Empty";
  }
}
