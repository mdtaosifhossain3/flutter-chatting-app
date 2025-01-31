import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_strings.dart';

class ButtonWidget extends StatelessWidget {
  final String name;
  final void Function() onPressed;
  const ButtonWidget({super.key, required this.name, required this.onPressed});

  // State to track if the button is enabled
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.dPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set a smaller radius
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 67)),
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
