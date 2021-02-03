// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

List<PlaceModel> placeModelFromJson(String str) =>
    List<PlaceModel>.from(json.decode(str).map((x) => PlaceModel.fromJson(x)));

String placeModelToJson(List<PlaceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlaceModel {
  PlaceModel({
    this.id,
    this.placeId,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String placeId;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  PlaceModel copyWith({
    int id,
    String placeId,
    String description,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      PlaceModel(
        id: id ?? this.id,
        placeId: placeId ?? this.placeId,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"] == null ? null : json["id"],
        placeId: json["place_id"] == null ? null : json["place_id"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "place_id": placeId == null ? null : placeId,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
