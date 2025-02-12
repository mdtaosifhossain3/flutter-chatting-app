import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/controllers/profile_page_controller.dart';

class NameField extends StatelessWidget {
  NameField({
    super.key,
  });

  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.00),
      child: Obx(() {
        print(profilePageController.isNameEdit.value);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.dOnTextColor, fontSize: 18),
                controller: profilePageController.nameController
                  ..text = profilePageController.displayName.value ?? "",
                decoration: InputDecoration(
                  border: profilePageController.isNameEdit.value
                      ? const OutlineInputBorder()
                      : InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.dGreyColor,
                    size: 30,
                  ),

                  labelText: "Name",
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  //  enabled: true,
                ),
                cursorHeight: 18,
                enabled: profilePageController.isNameEdit.value,
              ),
            ),
            profilePageController.isNameEdit.value
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      profilePageController.isNameEdit.value =
                          !profilePageController.isNameEdit.value;
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.dGreyColor,
                      size: 22,
                    )),
          ],
        );
      }),
    );
  }
}
