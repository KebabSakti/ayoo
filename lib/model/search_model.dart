// To parse this JSON data, do
//
//     final mostSearchModel = mostSearchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(
    json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
  SearchModel({
    this.keyword,
    this.hits,
    this.image,
  });

  String keyword;
  int hits;
  String image;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        keyword: json["keyword"],
        hits: json["hits"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "hits": hits,
        "image": image,
      };
}
