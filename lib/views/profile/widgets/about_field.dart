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

  final about = TextEditingController(text: "I am ghost");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: AppColors.dOnTextColor, fontSize: 18),
        controller: about,
        decoration: InputDecoration(
          border: profilePageController.isAboutEdit.value
              ? const OutlineInputBorder()
              : InputBorder.none,
          prefixIcon: const Icon(
            Icons.info,
            color: AppColors.dGreyColor,
            size: 30,
          ),
          suffixIcon: profilePageController.isAboutEdit.value
              ? null
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
          labelText: "About",
          labelStyle: Theme.of(context).textTheme.labelSmall,
          enabled: profilePageController.isAboutEdit.value,
        ),
        cursorHeight: 18,
        enabled: true,
      ),
    );
  }
}
