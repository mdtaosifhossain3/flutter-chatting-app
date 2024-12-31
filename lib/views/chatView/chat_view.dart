import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_images.dart';
import 'package:sampark/config/components/appbar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          bgColor: AppColors.dContainerColor,
          context: context,
          title: Row(
            children: [
              Image.asset(
                AppImages.boyUrl,
                width: 40,
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Muhammad Tao",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Online",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              )
            ],
          ),
          action: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.phone),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.dContainerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                "sssssssssssssssssssssssssssrs",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text("12:00 PM"),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: TextField(
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.dOnTextColor,
              ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(18),
            hintText: "Type a message",
            hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.dGreyColor,
                ),
            filled: true,
            fillColor: AppColors.dContainerColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(54),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(54),
            ),
            prefixIcon: IconButton(
              icon: SvgPicture.asset(AppImages.micUrl),
              onPressed: () {},
            ),
            suffixIcon: Container(
              width: 80,
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(AppImages.galleryUrl),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(AppImages.sendUrl)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
