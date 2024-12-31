import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sampark/config/routes/routes_name.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../config/app_strings.dart';

class SliderAction extends StatelessWidget {
  const SliderAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () async {
        Get.offAllNamed(RoutesName.loginView);
      },
      sliderRotate: false,
      innerColor: AppColors.dyYellowColor,
      outerColor: AppColors.dContainerColor,
      sliderButtonIcon: SizedBox(
        height: 25,
        width: 25,
        child: SvgPicture.asset(
          AppImages.plugUrl,
          height: 20,
          width: 20,
        ),
      ),
      submittedIcon: SvgPicture.asset(AppImages.connectorUrl),
      text: WelcomeViewStrings.sliderString,
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
  }
}
