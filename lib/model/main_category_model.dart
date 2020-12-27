// To parse this JSON data, do
//
//     final mainCategoryModel = mainCategoryModelFromJson(jsonString);

import 'dart:convert';

List<MainCategoryModel> mainCategoryModelFromJson(String str) =>
    List<MainCategoryModel>.from(
        json.decode(str).map((x) => MainCategoryModel.fromJson(x)));

String mainCategoryModelToJson(List<MainCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainCategoryModel {
  MainCategoryModel({
    this.id,
    this.mainCategoryId,
    this.deliveryTypeId,
    this.title,
    this.caption,
    this.image,
    this.color,
    this.link,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String mainCategoryId;
  String deliveryTypeId;
  String title;
  dynamic caption;
  String image;
  String color;
  dynamic link;
  int active;
  DateTime createdAt;
  DateTime updatedAt;

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) =>
      MainCategoryModel(
        id: json["id"],
        mainCategoryId: json["main_category_id"],
        deliveryTypeId: json["delivery_type_id"],
        title: json["title"],
        caption: json["caption"],
        image: json["image"],
        color: json["color"] == null ? null : json["color"],
        link: json["link"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main_category_id": mainCategoryId,
        "delivery_type_id": deliveryTypeId,
        "title": title,
        "caption": caption,
        "image": image,
        "color": color == null ? null : color,
        "link": link,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
