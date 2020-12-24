// To parse this JSON data, do
//
//     final introImageModel = introImageModelFromJson(jsonString);

import 'dart:convert';

List<IntroImageModel> introImageModelFromJson(String str) => List<IntroImageModel>.from(json.decode(str).map((x) => IntroImageModel.fromJson(x)));

String introImageModelToJson(List<IntroImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IntroImageModel {
    IntroImageModel({
        this.id,
        this.introId,
        this.url,
        this.title,
        this.caption,
        this.active,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String introId;
    String url;
    String title;
    String caption;
    int active;
    DateTime createdAt;
    DateTime updatedAt;

    factory IntroImageModel.fromJson(Map<String, dynamic> json) => IntroImageModel(
        id: json["id"],
        introId: json["intro_id"],
        url: json["url"],
        title: json["title"],
        caption: json["caption"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "intro_id": introId,
        "url": url,
        "title": title,
        "caption": caption,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
