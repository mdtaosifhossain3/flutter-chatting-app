import 'package:flutter/material.dart';

import '../../../../config/app_strings.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {}
        },
        child: const Text(AppStrings.loginST));
  }
}
