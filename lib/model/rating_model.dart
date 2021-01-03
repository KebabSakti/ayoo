// To parse this JSON data, do
//
//     final ratingModel = ratingModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/customer_model.dart';

List<RatingModel> ratingModelFromJson(String str) => List<RatingModel>.from(
    json.decode(str).map((x) => RatingModel.fromJson(x)));

String ratingModelToJson(List<RatingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RatingModel {
  RatingModel({
    this.id,
    this.ratingId,
    this.relationId,
    this.userId,
    this.star,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.customerModel,
  });

  int id;
  String ratingId;
  String relationId;
  String userId;
  String star;
  String comment;
  DateTime createdAt;
  DateTime updatedAt;
  CustomerModel customerModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json["id"],
        ratingId: json["rating_id"],
        relationId: json["relation_id"],
        userId: json["user_id"],
        star: json["star"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customerModel: CustomerModel.fromJson(json["customer_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating_id": ratingId,
        "relation_id": relationId,
        "user_id": userId,
        "star": star,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "customer_model": customerModel.toJson(),
      };
}
