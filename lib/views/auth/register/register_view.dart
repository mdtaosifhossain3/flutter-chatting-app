import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/config/components/welcome_heading.dart';
import 'package:sampark/views/auth/register//widgets/email_input_widget.dart';
import 'package:sampark/views/auth/register//widgets/password_input_widget.dart';
import 'package:sampark/views/auth/register//widgets/submit_button_widget.dart';
import 'package:sampark/views/auth/register/widgets/full_name.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
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

  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc();
  }

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _authBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: BlocProvider(
                create: (context) => _authBloc,
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
                            focusNode:
                                _passwordFocusNode, // Password input field
                          ),
                          const SizedBox(height: 30),
                          SubmitButton(
                            formKey: _formKey,
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
                )),
          ),
        ),
      ),
    );
  }
}
