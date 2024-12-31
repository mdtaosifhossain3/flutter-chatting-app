import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampark/bloc/auth_bloc/auth_bloc.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/utils/validations.dart';

/// A widget representing the email input field.
class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return TextFormField(
        focusNode: focusNode,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.dOnTextColor,
            ),
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
        keyboardType: TextInputType
            .emailAddress, // Setting keyboard type to email address
        onChanged: (value) {
          // Dispatching EmailChanged event when email input changes

          context.read<AuthBloc>().add(EmailChangedEvent(email: value));
        },
        validator: (value) {
          if (value!.isEmpty) {
            return LoginViewStrings.emailST;
          }
          if (!Validations.emailValidator(value)) {
            return 'Email is incorrect';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      );
    });
  }
}
