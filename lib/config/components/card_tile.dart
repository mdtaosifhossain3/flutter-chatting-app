import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_colors.dart';
import '../app_images.dart';
import '../routes/routes_name.dart';

class CardTile extends StatelessWidget {
  const CardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.offAllNamed(RoutesName.chatView);
      },
      leading: Image.asset(AppImages.boyUrl),
      title: Text(
        "Taoist Hossain",
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: Text("Bad me kot tot tu",
          style: Theme.of(context).textTheme.labelSmall),
      trailing: Text("9.00 am", style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
