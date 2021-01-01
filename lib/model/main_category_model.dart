// To parse this JSON data, do
//
//     final mainCategoryModel = mainCategoryModelFromJson(jsonString);

import 'dart:convert';

MainCategoryModel mainCategoryModelFromJson(String str) =>
    MainCategoryModel.fromJson(json.decode(str));

String mainCategoryModelToJson(MainCategoryModel data) =>
    json.encode(data.toJson());

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
    this.subCategoryModel,
    this.subCategoryId,
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
  List<MainCategoryModel> subCategoryModel;
  String subCategoryId;

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) =>
      MainCategoryModel(
        id: json["id"],
        mainCategoryId: json["main_category_id"],
        deliveryTypeId:
            json["delivery_type_id"] == null ? null : json["delivery_type_id"],
        title: json["title"],
        caption: json["caption"],
        image: json["image"],
        color: json["color"] == null ? null : json["color"],
        link: json["link"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subCategoryModel: json["sub_category_model"] == null
            ? null
            : List<MainCategoryModel>.from(json["sub_category_model"]
                .map((x) => MainCategoryModel.fromJson(x))),
        subCategoryId:
            json["sub_category_id"] == null ? null : json["sub_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main_category_id": mainCategoryId,
        "delivery_type_id": deliveryTypeId == null ? null : deliveryTypeId,
        "title": title,
        "caption": caption,
        "image": image,
        "color": color == null ? null : color,
        "link": link,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sub_category_model": subCategoryModel == null
            ? null
            : List<dynamic>.from(subCategoryModel.map((x) => x.toJson())),
        "sub_category_id": subCategoryId == null ? null : subCategoryId,
      };
}
