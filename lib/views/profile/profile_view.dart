import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_images.dart';
import 'package:sampark/config/components/appbar.dart';
import 'package:sampark/config/components/button_widget.dart';
import 'package:sampark/config/routes/routes_name.dart';
import 'package:sampark/controllers/upload_image_controller.dart';
import 'package:sampark/views/home/home_view.dart';
import 'package:sampark/views/profile/widgets/about_field.dart';
import 'package:sampark/views/profile/widgets/name_field.dart';
import 'package:sampark/views/profile/widgets/profile_tile.dart';

import '../../controllers/profile_page_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  final ImageUploadController imageUploadController =
      Get.put(ImageUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppbar(context: context, title: const Text("Profile"), action: [
        IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(RoutesName.loginView);
            },
            icon: Icon(Icons.logout))
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Obx(() {
            return Container(
              height: profilePageController.isNameEdit.value ||
                      profilePageController.isAboutEdit.value
                  ? MediaQuery.of(context).size.height * .65
                  : MediaQuery.of(context).size.height * .57,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.dContainerColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() {
                    return CircleAvatar(
                      radius: 56,
                      backgroundImage: imageUploadController.imageFile.value !=
                              null
                          ? FileImage(imageUploadController.imageFile.value!)
                          : const AssetImage(AppImages.boyUrl) as ImageProvider,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {
                              imageUploadController.pickAndUploadImage();
                            },
                            icon: const Icon(Icons.camera_alt)),
                      ),
                    );
                  }),
                  Column(
                    children: [
                      NameField(),
                      AboutField(),
                      ProfileTile(
                        leadingIcon: Icons.email,
                        title: profilePageController.email.toString(),
                        subTitle: "Email",
                        isEditable: false,
                      ),
                      ProfileTile(
                        leadingIcon: Icons.phone,
                        title: "0021586654255",
                        subTitle: "Number",
                        isEditable: false,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  profilePageController.isNameEdit.value ||
                          profilePageController.isAboutEdit.value
                      ? ButtonWidget(
                          name: "Save",
                          onPressed: () {
                            profilePageController.isNameEdit.value = false;
                            profilePageController.isAboutEdit.value = false;

                            profilePageController.updateProfile(context);
                          },
                        )
                      : const SizedBox.shrink()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
