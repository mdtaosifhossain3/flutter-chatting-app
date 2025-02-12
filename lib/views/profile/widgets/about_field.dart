import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/controllers/profile_page_controller.dart';

class AboutField extends StatelessWidget {
  AboutField({
    super.key,
  });

  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4.0),
      child: Obx(() {
        return Row(
          children: [
            Expanded(
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.dOnTextColor, fontSize: 18),
                controller: profilePageController.aboutController
                  ..text = profilePageController.aboutInfo.value ?? "",
                decoration: InputDecoration(
                  border: profilePageController.isAboutEdit.value
                      ? const OutlineInputBorder()
                      : InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.info,
                    color: AppColors.dGreyColor,
                    size: 30,
                  ),
                  labelText: "About",
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
                cursorHeight: 18,
                enabled: profilePageController.isAboutEdit.value,
              ),
            ),
            profilePageController.isAboutEdit.value
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      profilePageController.isAboutEdit.value =
                          !profilePageController.isAboutEdit.value;
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
