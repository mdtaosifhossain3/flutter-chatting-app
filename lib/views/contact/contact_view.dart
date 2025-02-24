import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/components/appbar.dart';
import 'package:sampark/config/components/card_tile.dart';
import 'package:sampark/controllers/chat_controller.dart';
import 'package:sampark/controllers/contact_view_controller.dart';
import 'package:sampark/models/user_model.dart';

import '../chatView/chat_view.dart';

class ContactView extends StatelessWidget {
  ContactView({super.key});

  final contactPageController = Get.put(ContactViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          context: context,
          bgColor: AppColors.dContainerColor,
          title: const Text("Contact"),
          action: [
            IconButton(
                onPressed: () {
                  contactPageController.isSearchBarShowed.value =
                      !contactPageController.isSearchBarShowed.value;
                },
                icon: Obx(() => contactPageController.isSearchBarShowed.value
                    ? const Icon(Icons.close)
                    : const Icon(Icons.search)))
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Obx(() {
              return contactPageController.isSearchBarShowed.value
                  ? Container(
                      width: double.infinity,
                      height: 80,
                      color: AppColors.dScaffoldColor,
                      child: Center(
                        child: Material(
                          elevation: 8,
                          child: TextField(
                            style: Theme.of(context).textTheme.labelLarge,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.dContainerColor,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: AppColors.dOnTextColor,
                                ),
                                hintText: "Search here...",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: AppColors.dGreyColor),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: AppColors.dContainerColor,
                                )),
                                focusedBorder: const OutlineInputBorder()),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            }),
            Expanded(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.dContainerColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.dPrimaryColor,
                            radius: 28,
                            child: Icon(Icons.person_add),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "New Contact",
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.dContainerColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.dPrimaryColor,
                            radius: 28,
                            child: Icon(Icons.person_add),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "New Group",
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Contacts on Sampark",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.dGreyColor),
                    ),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final snap = snapshot.data!.docs
                            .map((doc) => UserModel.fromJson(doc.data()))
                            .toList();

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snap.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final user = snap[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: CardTile(
                                  title: user.name,
                                  bgColor: AppColors.dContainerColor,
                                  subtitle: user.about,
                                  id: user.id,
                                  userModel: user,
                                  onTap: () {
                                    Get.to(ChatView(
                                      userModel: user,
                                    ));
                                  },
                                ),
                              );
                            });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
