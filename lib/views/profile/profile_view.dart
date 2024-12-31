import 'package:flutter/material.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_images.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/config/components/button_widget.dart';
import 'package:sampark/views/profile/widgets/profile_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .59,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.dContainerColor,
                borderRadius: BorderRadius.circular(20)),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(image: AssetImage(AppImages.boyUrl)),
                const Column(
                  children: [
                    ProfileTile(
                        leadingIcon: Icons.person,
                        title: "Nithsh Kumar",
                        subTitle: "Name",
                        trailingIcon: Icons.edit),
                    ProfileTile(
                        leadingIcon: Icons.info,
                        title: "I am ghost",
                        subTitle: "About",
                        trailingIcon: Icons.edit),
                    ProfileTile(
                      leadingIcon: Icons.email,
                      title: "netesh@gmail.com",
                      subTitle: "Email",
                    ),
                    ProfileTile(
                      leadingIcon: Icons.phone,
                      title: "0021586654255",
                      subTitle: "Number",
                    )
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                ButtonWidget(
                  name: "Save",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
