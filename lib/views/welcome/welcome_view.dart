import 'package:flutter/material.dart';
import 'package:sampark/views/welcome/widgets/slider_action.dart';
import 'package:sampark/views/welcome/widgets/welcome_body.dart';

import '../../config/components/welcome_heading.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [WelcomeHeading(), WelcomeBody(), SliderAction()],
            ),
          ),
        ),
      ),
    );
  }
}
