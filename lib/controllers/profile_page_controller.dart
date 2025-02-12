import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageController extends GetxController {
  RxBool isAboutEdit = false.obs;
  RxBool isNameEdit = false.obs;
  var user = FirebaseAuth.instance.currentUser;
  var displayName = ''.obs;
  var aboutInfo = ''.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  final String email = FirebaseAuth.instance.currentUser!.email.toString();

  @override
  void onInit() async {
    super.onInit();
    fetchUserData();
  }

  // Fetch user data from Fire store
  void fetchUserData() async {
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      displayName.value = doc['name'] ?? 'User';
      aboutInfo.value = doc['about'] ?? '';
    }
  }

  // Update user profile info
  Future<void> updateProfile(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                ]),
          );
        });
    try {
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update({
          'name': nameController.text,
          'about': aboutController.text,
        });
        user!.updateDisplayName(nameController.text);

        fetchUserData(); // Refresh data
        Get.snackbar("Success", "Saved Successfully");
        Navigator.pop(context);
      }
    } catch (e) {
      Navigator.pop(context);
      Get.snackbar("Error", "Something Went Wrong. Please try again later");
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // // Update profile image
  // Future<void> updateProfileImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     final file = File(pickedFile.path);
  //     final ref = FirebaseStorage.instance
  //         .ref()
  //         .child('user_images')
  //         .child('${user!.email}.jpg');
  //     await ref.putFile(file);
  //     final url = await ref.getDownloadURL();
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user!.email)
  //         .update({'photoURL': url});
  //     user!.updatePhotoURL(url);
  //     photoURL.value = url;
  //     fetchUserData(); // Refresh data
  //   }
  // }

  void saveInfo() async {}
}
