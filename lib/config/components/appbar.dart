import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';

PreferredSizeWidget customAppbar(
    {Widget? title,
    List<Widget>? action,
    Widget? isLeading,
    required BuildContext context,
    Color? bgColor}) {
  return AppBar(
    foregroundColor: AppColors.dOnTextColor,
    backgroundColor: bgColor,
    surfaceTintColor: bgColor,
    leading: isLeading ??
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            )),
    title: title,
    actions: action,
  );
}
