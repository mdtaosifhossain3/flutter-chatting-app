import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageController extends GetxController {
  RxBool isAboutEdit = false.obs;
  RxBool isNameEdit = false.obs;
  var user = FirebaseAuth.instance.currentUser;
  var displayName = ''.obs;
  var photoURL = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  // Fetch user data from Fire store
  void fetchUserData() async {
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.email)
          .get();
      photoURL.value = doc['photoURL'] ?? user!.photoURL ?? '';
    }
  }

  // Update profile image
  Future<void> updateProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${user!.email}.jpg');
      await ref.putFile(file);
      final url = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.email)
          .update({'photoURL': url});
      user!.updatePhotoURL(url);
      photoURL.value = url;
      fetchUserData(); // Refresh data
    }
  }
}
