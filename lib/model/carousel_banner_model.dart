// To parse this JSON data, do
//
//     final carouselBannerModel = carouselBannerModelFromJson(jsonString);

import 'dart:convert';

List<CarouselBannerModel> carouselBannerModelFromJson(String str) =>
    List<CarouselBannerModel>.from(
        json.decode(str).map((x) => CarouselBannerModel.fromJson(x)));

String carouselBannerModelToJson(List<CarouselBannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarouselBannerModel {
  CarouselBannerModel({
    this.id,
    this.promoId,
    this.mainCategoryId,
    this.url,
    this.home,
    this.active,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String promoId;
  String mainCategoryId;
  String url;
  int home;
  int active;
  dynamic link;
  DateTime createdAt;
  DateTime updatedAt;

  factory CarouselBannerModel.fromJson(Map<String, dynamic> json) =>
      CarouselBannerModel(
        id: json["id"],
        promoId: json["promo_id"],
        mainCategoryId:
            json["main_category_id"] == null ? null : json["main_category_id"],
        url: json["url"],
        home: json["home"],
        active: json["active"],
        link: json["link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "promo_id": promoId,
        "main_category_id": mainCategoryId == null ? null : mainCategoryId,
        "url": url,
        "home": home,
        "active": active,
        "link": link,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
