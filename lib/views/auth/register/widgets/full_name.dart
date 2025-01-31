import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampark/bloc/auth_bloc/auth_bloc.dart';
import 'package:sampark/config/app_colors.dart';

import '../../../../config/app_strings.dart';

/// A widget representing the email input field.
class FullName extends StatelessWidget {
  const FullName({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, AuthState state) {
      return TextFormField(
        focusNode: focusNode,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.dOnTextColor,
            ),
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
          context.read<AuthBloc>().add(FullNameChangedEvent(name: value));
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Full Name";
          }

          return null;
        },
        textInputAction: TextInputAction.next,
      );
    });
  }
}
