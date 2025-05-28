// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  int? id;
  String? username;
  String? name;
  String? phoneNumber;
  String? email;
  dynamic profilePicture;
  String? token;

  UserInfo({
    this.id,
    this.username,
    this.name,
    this.phoneNumber,
    this.email,
    this.profilePicture,
    this.token,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    profilePicture: json["profile_picture"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "phone_number": phoneNumber,
    "email": email,
    "profile_picture": profilePicture,
    "token": token,
  };
}
