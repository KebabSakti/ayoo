// To parse this JSON data, do
//
//     final mostSearchModel = mostSearchModelFromJson(jsonString);

import 'dart:convert';

List<MostSearchModel> mostSearchModelFromJson(String str) =>
    List<MostSearchModel>.from(
        json.decode(str).map((x) => MostSearchModel.fromJson(x)));

String mostSearchModelToJson(List<MostSearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MostSearchModel {
  MostSearchModel({
    this.keyword,
    this.hits,
    this.image,
  });

  String keyword;
  int hits;
  String image;

  factory MostSearchModel.fromJson(Map<String, dynamic> json) =>
      MostSearchModel(
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
