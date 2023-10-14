import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  User? getUser() {
    return _auth.currentUser;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return "Success";
    } catch (e) {
      debugPrint(e.toString() + "@@");
    }
    return "Empty message";
  }

  Future<String> register(
      {required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } catch (e) {
      debugPrint(e.toString());
    }
    return "Empty";
  }
}
