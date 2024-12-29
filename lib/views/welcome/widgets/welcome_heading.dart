import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/app_images.dart';
import '../../../config/app_strings.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.logoUrl),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
