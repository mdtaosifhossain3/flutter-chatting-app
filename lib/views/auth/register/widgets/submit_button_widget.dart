import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampark/bloc/auth_bloc/auth_bloc.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/config/components/button_widget.dart';
import 'package:sampark/config/routes/routes_name.dart';
import 'package:sampark/utils/enums.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;

  SubmitButton({
    super.key,
    required this.formKey,
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
            return ButtonWidget(
                name: state.postApiStatus == PostApiStatus.loading ||
                        state.postApiStatus == PostApiStatus.success
                    ? "Loading..."
                    : "Register",
                onPressed: state.postApiStatus == PostApiStatus.loading
                    ? () {}
                    : () {
                        if (formKey.currentState.validate()) {
                          context.read<AuthBloc>().add(RegisterSubmitEvent());
                        }
                      });
          }),
    );
  }
}
