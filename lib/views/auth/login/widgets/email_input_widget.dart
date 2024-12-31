import 'package:flutter/material.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_strings.dart';

/// A widget representing the email input field.
class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: AppColors.dGreyColor,
          ),
          hintText: LoginViewStrings.emailST,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          filled: true,
          fillColor: AppColors.dContainerColor,
          border: const OutlineInputBorder()),
      keyboardType:
          TextInputType.emailAddress, // Setting keyboard type to email address
      onChanged: (value) {
        // Dispatching EmailChanged event when email input changes
      },
      validator: (value) {
        if (value!.isEmpty) {
          return LoginViewStrings.emailST;
        }

        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}
