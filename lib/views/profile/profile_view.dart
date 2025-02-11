import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_images.dart';
import 'package:sampark/config/components/appbar.dart';
import 'package:sampark/config/components/button_widget.dart';
import 'package:sampark/views/home/home_view.dart';
import 'package:sampark/views/profile/widgets/about_field.dart';
import 'package:sampark/views/profile/widgets/name_field.dart';
import 'package:sampark/views/profile/widgets/profile_tile.dart';

import '../../controllers/profile_page_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          context: context,
          isLeading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const HomeView();
                }));
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Profile")),
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
                  CircleAvatar(
                    radius: 56,
                    backgroundImage: profilePageController
                            .photoURL.value.isNotEmpty
                        ? NetworkImage(profilePageController.photoURL.value)
                        : const AssetImage(AppImages.boyUrl) as ImageProvider,
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                  Column(
                    children: [
                      NameField(),
                      AboutField(),
                      ProfileTile(
                          leadingIcon: Icons.email,
                          title: "netesh@gmail.com",
                          subTitle: "Email",
                          isEditable: false),
                      ProfileTile(
                          leadingIcon: Icons.phone,
                          title: "0021586654255",
                          subTitle: "Number",
                          isEditable: false)
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
                          },
                        )
                      : SizedBox.shrink()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
