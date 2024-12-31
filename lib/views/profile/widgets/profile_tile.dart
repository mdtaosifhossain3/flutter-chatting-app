import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class ProfileTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final IconData? trailingIcon;
  const ProfileTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.subTitle,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            leadingIcon,
            color: AppColors.dGreyColor,
            size: 30,
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
          Spacer(),
          trailingIcon != null
              ? Icon(
                  trailingIcon,
                  color: AppColors.dGreyColor,
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
