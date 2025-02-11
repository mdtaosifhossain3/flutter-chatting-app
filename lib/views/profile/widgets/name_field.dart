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

  final name = TextEditingController(text: "Neethu");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.00),
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: AppColors.dOnTextColor, fontSize: 18),
        controller: name,
        decoration: InputDecoration(
          border: profilePageController.isNameEdit.value
              ? const OutlineInputBorder()
              : InputBorder.none,
          prefixIcon: Icon(
            Icons.person,
            color: AppColors.dGreyColor,
            size: 30,
          ),
          suffixIcon: profilePageController.isNameEdit.value
              ? null
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
          labelText: "Name",
          labelStyle: Theme.of(context).textTheme.labelSmall,
          enabled: profilePageController.isNameEdit.value,
        ),
        cursorHeight: 18,
        enabled: true,
      ),
    );
  }
}
