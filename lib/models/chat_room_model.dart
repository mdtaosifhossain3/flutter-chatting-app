import 'package:sampark/models/user_model.dart';

class ChatRoomModelModel {
  String id;
  String sender;
  UserModel receiver;
  int unReadMessageNo;
  String lastMessage;
  String lastMessageTimeStamp;
  String timeStamp;

  ChatRoomModelModel({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.unReadMessageNo,
    required this.lastMessage,
    required this.lastMessageTimeStamp,
    required this.timeStamp,
  });

  factory ChatRoomModelModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModelModel(
      id: json['id'] ?? '',
      sender: json['sender'] ?? '',
      receiver: UserModel.fromJson(json['receiver'] ?? {}),
      unReadMessageNo: json['unReadMessageNo'] ?? 0,
      lastMessage: json['lastMessage'] ?? '',
      lastMessageTimeStamp: json['lastMessageTimeStamp'] ?? '',
      timeStamp: json['timeStamp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver.toJson(),
      'unReadMessageNo': unReadMessageNo,
      'lastMessage': lastMessage,
      'lastMessageTimeStamp': lastMessageTimeStamp,
      'timeStamp': timeStamp,
    };
  }
}
