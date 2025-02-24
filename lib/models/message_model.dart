class Message {
  String id;
  String message;
  String senderName;
  String senderId;
  String receiverId;
  DateTime timeStamp;
  String? readStatus;
  String? imageUrl;
  String? videoUrl;
  String? audioUrl;
  String? documentUrl;
  List<String>? reactions;
  List<Message>? replies;

  Message({
    required this.id,
    required this.message,
    required this.senderName,
    required this.senderId,
    required this.receiverId,
    required this.timeStamp,
    this.readStatus,
    this.imageUrl,
    this.videoUrl,
    this.audioUrl,
    this.documentUrl,
    this.reactions,
    this.replies,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      message: json['message'] ?? '',
      senderName: json['senderName'] ?? '',
      senderId: json['senderId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      timeStamp: DateTime.fromMillisecondsSinceEpoch(json['timeStamp'] ?? 0),
      readStatus: json['readStatus'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      documentUrl: json['documentUrl'] ?? '',
      reactions: List<String>.from(json['reactions'] ?? []),
      replies: (json['replies'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'senderName': senderName,
      'senderId': senderId,
      'receiverId': receiverId,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'readStatus': readStatus,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'audioUrl': audioUrl,
      'documentUrl': documentUrl,
      'reactions': reactions != null ? reactions!.toList() : [],
      'replies':
          replies != null ? replies!.map((e) => e.toJson()).toList() : [],
    };
  }
}
