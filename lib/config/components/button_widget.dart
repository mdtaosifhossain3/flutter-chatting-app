import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_strings.dart';

class ButtonWidget extends StatelessWidget {
  final String name;
  const ButtonWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.dPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set a smaller radius
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70)),
      child: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: AppColors.dOnTextColor),
      ),
    );
  }
}
