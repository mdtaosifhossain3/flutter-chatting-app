import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampark/bloc/auth_bloc/auth_bloc.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/config/routes/routes_name.dart';
import 'package:sampark/utils/enums.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  final String name;
  final String email;
  final String password;

  const SubmitButton({
    super.key,
    required this.formKey,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          Get.snackbar("Error", state.message.toString());
        }

        if (state.postApiStatus == PostApiStatus.success) {
          Get.snackbar("Success", "Successfully Registered");
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (current, previous) =>
              current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                print(name);
                print(email);
                print(password);
                print("Hello World");

                if (formKey.currentState.validate()) {
                  context.read<AuthBloc>().add(RegisterSubmitEvent(
                      name: name, email: email, password: password));
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
                  child: Text(
                    AppStrings.registerST,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: AppColors.dOnTextColor),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
