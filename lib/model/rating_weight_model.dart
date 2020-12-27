// To parse this JSON data, do
//
//     final ratingWeightModel = ratingWeightModelFromJson(jsonString);

import 'dart:convert';

RatingWeightModel ratingWeightModelFromJson(String str) =>
    RatingWeightModel.fromJson(json.decode(str));

String ratingWeightModelToJson(RatingWeightModel data) =>
    json.encode(data.toJson());

class RatingWeightModel {
  RatingWeightModel({
    this.id,
    this.ratingWeightId,
    this.relationId,
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
    this.totalVote,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String ratingWeightId;
  String relationId;
  int one;
  int two;
  int three;
  int four;
  int five;
  int totalVote;
  String rating;
  DateTime createdAt;
  DateTime updatedAt;

  factory RatingWeightModel.fromJson(Map<String, dynamic> json) =>
      RatingWeightModel(
        id: json["id"],
        ratingWeightId: json["rating_weight_id"],
        relationId: json["relation_id"],
        one: json["one"],
        two: json["two"],
        three: json["three"],
        four: json["four"],
        five: json["five"],
        totalVote: json["total_vote"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating_weight_id": ratingWeightId,
        "relation_id": relationId,
        "one": one,
        "two": two,
        "three": three,
        "four": four,
        "five": five,
        "total_vote": totalVote,
        "rating": rating,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
