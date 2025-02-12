import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_colors.dart';
import '../app_images.dart';
import '../routes/routes_name.dart';

class CardTile extends StatelessWidget {
  final Color? bgColor;
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subtitle;
  const CardTile(
      {super.key,
      required this.title,
      this.subtitle = "",
      this.bgColor,
      this.leading,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      tileColor: bgColor ?? Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onTap: () {
        Get.toNamed(RoutesName.chatView);
      },
      leading: leading ?? Image.asset(AppImages.boyUrl),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: Text(subtitle!, style: Theme.of(context).textTheme.labelSmall),
      trailing: trailing ??
          Text("9.00 am", style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
