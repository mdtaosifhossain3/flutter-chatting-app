import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_images.dart';
import 'package:sampark/config/components/appbar.dart';
import 'package:sampark/controllers/chat_controller.dart';
import 'package:sampark/models/message_model.dart';
import 'package:sampark/models/user_model.dart';
import 'package:uuid/uuid.dart';

class ChatView extends StatelessWidget {
  final UserModel? userModel;
  TextEditingController textEditingController = TextEditingController();
  final ChatController chatController = Get.put(ChatController());
  final uuid = Uuid();
  ChatView({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          bgColor: AppColors.dContainerColor,
          context: context,
          title: GestureDetector(
            onTap: () {},
            child: Row(
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
                      userModel?.name ?? "User Name",
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
          ),
          action: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.phone),
            )
          ]),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
              stream: chatController.getMessages(userModel!.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Let's Start Chatting"));
                }
                final snap = snapshot.data;

                return ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      final dateTimeString = snap[index].timeStamp;
                      String formattedTime =
                          DateFormat("h.mm a").format(dateTimeString);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          crossAxisAlignment:
                              snap[index].receiverId == chatController.auth!.uid
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.dContainerColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(10),
                                  topRight: const Radius.circular(10),
                                  bottomRight: snap[index].receiverId ==
                                          chatController.auth!.uid
                                      ? Radius.circular(10)
                                      : Radius.circular(0),
                                  bottomLeft: snap[index].receiverId ==
                                          chatController.auth!.uid
                                      ? Radius.circular(0)
                                      : Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                snap[index].message,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(formattedTime),
                          ],
                        ),
                      );
                    });
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextField(
          controller: textEditingController,
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
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        if (textEditingController.text.isEmpty) {
                          Get.snackbar("Info", "Input field can't be empty");
                        }
                        if (textEditingController.text.isNotEmpty) {
                          final message = Message(
                              id: uuid.v6(),
                              message: textEditingController.text,
                              senderName:
                                  chatController.auth!.displayName.toString(),
                              senderId: chatController.auth!.uid,
                              receiverId: userModel!.id,
                              timeStamp: DateTime.now(),
                              readStatus: "",
                              imageUrl: "",
                              videoUrl: "",
                              audioUrl: "",
                              documentUrl: "",
                              reactions: [],
                              replies: []);
                          chatController.sendMessage(
                              userModel!.id, message, userModel!);

                          textEditingController.clear();
                        }
                      },
                      child: SvgPicture.asset(AppImages.sendUrl))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
