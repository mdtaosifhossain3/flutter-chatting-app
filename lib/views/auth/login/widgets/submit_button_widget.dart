import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampark/bloc/auth_bloc/auth_bloc.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_strings.dart';
import '../../../../utils/enums.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          print(state.message.toString());
        }

        if (state.postApiStatus == PostApiStatus.success) {
          print("Login Successfully");
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (formKey.currentState.validate()) {
                context.read<AuthBloc>().add(LoginSubmitEvent());
              }
            },
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: AppColors.dPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: state.postApiStatus == PostApiStatus.loading
                    ? Text(
                        "Loading...",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.dOnTextColor),
                      )
                    : Text(
                        AppStrings.loginST,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: AppColors.dOnTextColor),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
