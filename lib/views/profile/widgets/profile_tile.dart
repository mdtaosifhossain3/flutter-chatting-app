import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/controllers/profile_page_controller.dart';

import '../../../config/app_colors.dart';

class ProfileTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final IconData? trailingIcon;
  bool isEditable = false;
  final bool? isNameEdit;
  ProfileTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.subTitle,
      this.trailingIcon,
      required this.isEditable,
      this.isNameEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              leadingIcon,
              color: AppColors.dGreyColor,
              size: 30,
            ),
            const SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                isEditable && Get.find<ProfilePageController>().isNameEdit.value
                    ? SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .65,
                        child: TextField(
                          cursorHeight: 18,
                          enabled: Get.find<ProfilePageController>()
                              .isNameEdit
                              .value,
                        ))
                    : const SizedBox.shrink(),
                isEditable
                    ? const SizedBox.shrink()
                    : Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                      )
              ],
            ),
            trailingIcon != null
                ? InkWell(
                    onTap: () {
                      if (isEditable) {
                        if (subTitle == "Name") {
                          Get.find<ProfilePageController>().isNameEdit.value =
                              !Get.find<ProfilePageController>()
                                  .isNameEdit
                                  .value;
                        } else {
                          Get.find<ProfilePageController>().isAboutEdit.value =
                              !Get.find<ProfilePageController>()
                                  .isAboutEdit
                                  .value;
                        }
                      }
                    },
                    child: Icon(
                      trailingIcon,
                      color: AppColors.dGreyColor,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ));
  }
}
