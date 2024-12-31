import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_strings.dart';

/// A widget representing the password input field.
class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode, // Setting focus node

      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: AppColors.dGreyColor,
          ),
          hintText: LoginViewStrings.passwordST,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          filled: true,
          fillColor: AppColors.dContainerColor,
          border: const OutlineInputBorder(),
          errorMaxLines: 2),
      obscureText:
          true, // Making the text input obscure (i.e., showing dots instead of actual characters)
      validator: (value) {
        if (value!.isEmpty) {
          return LoginViewStrings.passwordST;
        }
        if (value.length < 6) {
          return 'please enter password greater than 6 char';
        }

        return null;
      },
      onChanged: (value) {
        // Dispatching PasswordChanged event when password input changes
      },
      textInputAction: TextInputAction.done,
    );
  }
}
