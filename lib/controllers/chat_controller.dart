import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark/models/chat_room_model.dart';
import 'package:sampark/models/message_model.dart';
import 'package:sampark/models/user_model.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  RxList<ChatRoomModelModel> chatRoomList = <ChatRoomModelModel>[].obs;
  var uuid = Uuid();

  void onInit() {
    //  await getChatRoom();
    listenToChatRoom();
    super.onInit();
  }

  String getRoomID(String chatUser) {
    final currentUserID = auth!.uid;

    if (currentUserID[0].codeUnitAt(0) > chatUser[0].codeUnitAt(0)) {
      return currentUserID + chatUser;
    } else {
      return chatUser + currentUserID;
    }
  }

  Future<void> sendMessage(
      String chatUserID, Message message, UserModel targetUser) async {
    //Get the Root ID
    final roomId = getRoomID(chatUserID);
    String chatID = uuid.v6();
    isLoading.value = true;

    //New Chat
    var newChat = Message(
      id: chatID,
      message: message.message,
      senderName: auth!.displayName!,
      senderId: auth!.uid,
      receiverId: chatUserID,
      timeStamp: DateTime.now(),
    );
    //Room Details
    var roomDetails = ChatRoomModelModel(
        id: roomId,
        sender: auth!.displayName.toString(),
        receiver: targetUser,
        unReadMessageNo: 0,
        lastMessage: message.message,
        lastMessageTimeStamp: DateTime.now().toString(),
        timeStamp: DateTime.now().toString());
    try {
      await db.collection("chats").doc(roomId).set(roomDetails.toJson());

      //Creating the collection
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(message.id)
          .set(newChat.toJson());

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print({
        "id": roomId,
        "sender": auth!.displayName.toString(),
        "receiver": targetUser,
        "unReadMessageNo": 0,
        "lastMessage": message.message,
        "lastMessageTimeStamp": DateTime.now().toString(),
        "timeStamp": DateTime.now().toString()
      });
      print(roomDetails);

      print(e);
    }
  }

  Stream getMessages(String chatUserID) {
    final id = getRoomID(chatUserID);

    return db
        .collection("chats")
        .doc(id)
        .collection("messages")
        .orderBy("timeStamp")
        .snapshots()
        .map((docs) =>
            docs.docs.map((elm) => Message.fromJson(elm.data())).toList());
  }

  // RxBool loa = false.obs;
  // Future<void> getChatRoom() async {
  //   try {
  //     loa.value = true;
  //     List<ChatRoomModelModel> tempRoomList = [];
  //     await db.collection("chats").get().then((onValue) {
  //       tempRoomList = onValue.docs
  //           .map((toElement) => ChatRoomModelModel.fromJson(toElement.data()))
  //           .toList();
  //     });
  //
  //     chatRoomList.value =
  //         tempRoomList.where((elm) => elm.id.contains(auth!.uid)).toList();
  //     loa.value = false;
  //   } catch (e) {
  //     loa.value = false;
  //   }
  // }

  StreamSubscription? chatSubscription;
  void listenToChatRoom() {
    chatSubscription = db
        .collection("chats")
        .orderBy("lastMessageTimeStamp", descending: true)
        .snapshots()
        .listen((onValue) {
      List<ChatRoomModelModel> tempRoomList = onValue.docs
          .map((toElement) => ChatRoomModelModel.fromJson(toElement.data()))
          .toList();

      chatRoomList.value =
          tempRoomList.where((elm) => elm.id.contains(auth!.uid)).toList();
    });
  }
}
