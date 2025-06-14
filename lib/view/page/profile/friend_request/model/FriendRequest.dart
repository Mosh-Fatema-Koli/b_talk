

import 'dart:convert';

FriendRequest friendRequestFromJson(String str) => FriendRequest.fromJson(json.decode(str));

String friendRequestToJson(FriendRequest data) => json.encode(data.toJson());

class FriendRequest {
  int? id;
  String? username;
  String? name;
  String? phoneNumber;
  String? profilePicture;
  int? requestId;
  String? requestAt;

  FriendRequest({
    this.id,
    this.username,
    this.name,
    this.phoneNumber,
    this.profilePicture,
    this.requestId,
    this.requestAt,
  });

  factory FriendRequest.fromJson(Map<String, dynamic> json) => FriendRequest(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    profilePicture: json["profile_picture"],
    requestId: json["request_id"],
    requestAt: json["request_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "phone_number": phoneNumber,
    "profile_picture": profilePicture,
    "request_id": requestId,
    "request_at": requestAt,
  };
}
