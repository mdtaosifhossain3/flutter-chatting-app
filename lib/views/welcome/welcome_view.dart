import 'package:flutter/material.dart';
import 'package:sampark/views/welcome/widgets/welcome_heading.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              WelcomeHeading(),
            ],
          ),
        ),
      ),
    );
  }
}
