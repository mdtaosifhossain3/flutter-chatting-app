class UserModel {
  String id;
  String name;
  String email;
  String phone;
  String about;
  String photoURL;
  String status;
  DateTime createdAt;
  DateTime lastActive;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.about,
    required this.photoURL,
    required this.status,
    required this.createdAt,
    required this.lastActive,
  });

  // Convert JSON to Dart Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      about: json["about"],
      photoURL: json["photoURL"],
      status: json["status"],
      createdAt: DateTime.parse(json["createdAt"]),
      lastActive: DateTime.parse(json["lastActive"]),
    );
  }

  // Convert Dart Object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "about": about,
      "photoURL": photoURL,
      "status": status,
      "createdAt": createdAt.toIso8601String(),
      "lastActive": lastActive.toIso8601String(),
    };
  }
}
