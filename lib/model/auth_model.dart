// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.userId,
    this.token,
  });

  String userId;
  String token;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        userId: json["user_id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "token": token,
      };
}
