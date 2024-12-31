import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/config/components/welcome_heading.dart';
import 'package:sampark/views/auth/login/widgets/email_input_widget.dart';
import 'package:sampark/views/auth/login/widgets/password_input_widget.dart';
import 'package:sampark/views/auth/register/widgets/full_name.dart';

import '../../../config/routes/routes_name.dart';

/// A widget representing the login screen of the application.
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

/// The state of the [LoginScreen] widget.
class _RegisterViewState extends State<RegisterView> {
  final _fullNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const WelcomeHeading(), // Heading text or logo
                  Column(
                    children: [
                      FullName(
                        focusNode: _fullNameFocusNode, // Email input field
                      ),
                      const SizedBox(height: 20),
                      EmailInput(
                        focusNode: _emailFocusNode, // Email input field
                      ),
                      const SizedBox(height: 20),
                      PasswordInput(
                        focusNode: _passwordFocusNode, // Password input field
                      ),
                      const SizedBox(height: 30),
                      Container(
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
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(RegisterViewStrings.desc),
                      TextButton(
                          onPressed: () {
                            Get.offAllNamed(RoutesName.loginView);
                          },
                          child: const Text(AppStrings.loginST))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
