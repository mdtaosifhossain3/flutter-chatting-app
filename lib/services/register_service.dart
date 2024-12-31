import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../data/exceptions/app_exceptions.dart';

class RegisterService {
  final _instance = FirebaseAuth.instance;
  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var cred = await _instance.signInWithEmailAndPassword(
          email: email, password: password);

      if (cred.user != null) {
        //Update DisplayName
        await FirebaseAuth.instance.currentUser!.updateDisplayName(name);

        // Create an user Collection
        await FirebaseFirestore.instance
            .collection("users")
            .doc(cred.user!.uid)
            .set({"name": name, "email": email});
      }

      return;
    } catch (e) {
      print(e);
    }
  }
}
