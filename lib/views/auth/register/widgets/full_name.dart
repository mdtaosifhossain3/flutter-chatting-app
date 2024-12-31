import 'package:flutter/material.dart';
import 'package:sampark/config/app_colors.dart';

import '../../../../config/app_strings.dart';

/// A widget representing the email input field.
class FullName extends StatelessWidget {
  const FullName({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person,
            color: AppColors.dGreyColor,
          ),
          hintText: RegisterViewStrings.fullNameST,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          filled: true,
          fillColor: AppColors.dContainerColor,
          border: const OutlineInputBorder()),
      onChanged: (value) {
        // Dispatching EmailChanged event when email input changes
      },
      validator: (value) {
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}
