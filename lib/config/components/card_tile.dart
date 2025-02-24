import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampark/controllers/chat_controller.dart';
import 'package:sampark/models/user_model.dart';
import 'package:sampark/views/chatView/chat_view.dart';

import '../app_colors.dart';
import '../app_images.dart';
import '../routes/routes_name.dart';

class CardTile extends StatelessWidget {
  final chatController = Get.put(ChatController());
  final Color? bgColor;
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final String? id;
  final UserModel? userModel;
  void Function()? onTap;
  CardTile(
      {super.key,
      this.id,
      required this.title,
      this.subtitle = "",
      this.bgColor,
      this.leading,
      this.trailing,
      this.userModel,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      tileColor: bgColor ?? Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onTap: onTap,
      leading: leading ?? Image.asset(AppImages.boyUrl),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: Text(subtitle!,
          maxLines: 1, style: Theme.of(context).textTheme.labelSmall),
      trailing:
          trailing ?? Text("", style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
