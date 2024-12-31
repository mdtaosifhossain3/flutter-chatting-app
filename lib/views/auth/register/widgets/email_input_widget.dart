import 'package:flutter/material.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/utils/validations.dart';

/// A widget representing the email input field.
class EmailInput extends StatelessWidget {
  const EmailInput(
      {super.key, required this.focusNode, required this.controller});

  final FocusNode focusNode;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.dOnTextColor,
          ),
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: AppColors.dGreyColor,
          ),
          hintText: RegisterViewStrings.emailST,
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
          return RegisterViewStrings.passwordST;
        }
        if (!Validations.emailValidator(value)) {
          print("sssssssssssssss");
          return 'Email is incorrect';
        }

        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}
