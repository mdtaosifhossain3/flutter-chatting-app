import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/components/appbar.dart';
import 'package:sampark/config/components/card_tile.dart';
import 'package:sampark/controllers/contact_view_controller.dart';

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
                icon: const Icon(Icons.search))
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // Container(
            //   width: double.infinity,
            //   height: 80,
            //   color: AppColors.dScaffoldColor,
            //   child: Center(
            //     child: TextField(
            //       style: Theme.of(context).textTheme.labelLarge,
            //       decoration: InputDecoration(
            //           hintText: "Search here...",
            //           enabledBorder: OutlineInputBorder(),
            //           focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                   color: AppColors.dPrimaryColor, width: 2.00))),
            //     ),
            //   ),
            // ),
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
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.dOnTextColor,
                                ),
                                hintText: "Search here...",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: AppColors.dGreyColor),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: AppColors.dContainerColor,
                                )),
                                focusedBorder: OutlineInputBorder()),
                          ),
                        ),
                      ),
                    )
                  : SizedBox();
            }),
            Expanded(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.dContainerColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.dPrimaryColor,
                            radius: 28,
                            child: Icon(Icons.person_add),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "New Contact",
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.dContainerColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.dPrimaryColor,
                            radius: 28,
                            child: Icon(Icons.person_add),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "New Group",
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Contacts on Sampark",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.dGreyColor),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: CardTile(
                            title: "Taosif",
                            bgColor: AppColors.dContainerColor,
                            subtitle: "This is subtitle",
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
