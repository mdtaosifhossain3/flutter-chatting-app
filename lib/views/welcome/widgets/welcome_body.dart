import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/app_images.dart';
import '../../../config/app_strings.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.boyUrl),
            SvgPicture.asset(AppImages.connectorUrl),
            Image.asset(AppImages.girlUrl),
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          WelcomeViewStrings.nowWeAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomeViewStrings.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          WelcomeViewStrings.desc,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
