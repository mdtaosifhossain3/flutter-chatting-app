import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageUploadController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  var imageFile = Rx<File?>(null);
  var isUploading = false.obs;

  /// Pick image from gallery and upload
  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    isUploading.value = true;

    File image = File(pickedFile.path);
    String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      await supabase.storage.from('user_images').upload(fileName, image);

      imageFile.value = image;
      isUploading.value = false;

      Get.snackbar("Success", "Image uploaded");
    } catch (e) {
      isUploading.value = false;
      Get.snackbar("Error", "Upload failed: $e");
    }
  }
}
