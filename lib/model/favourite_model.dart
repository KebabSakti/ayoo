// To parse this JSON data, do
//
//     final favouriteModel = favouriteModelFromJson(jsonString);

import 'dart:convert';

List<FavouriteModel> favouriteModelFromJson(String str) =>
    List<FavouriteModel>.from(
        json.decode(str).map((x) => FavouriteModel.fromJson(x)));

String favouriteModelToJson(List<FavouriteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavouriteModel {
  FavouriteModel({
    this.id,
    this.favouriteId,
    this.userId,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String favouriteId;
  String userId;
  String productId;
  DateTime createdAt;
  DateTime updatedAt;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        id: json["id"] == null ? null : json["id"],
        favouriteId: json["favourite_id"] == null ? null : json["favourite_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "favourite_id": favouriteId == null ? null : favouriteId,
        "user_id": userId == null ? null : userId,
        "product_id": productId == null ? null : productId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
