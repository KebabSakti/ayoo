// To parse this JSON data, do
//
//     final distanceResponseModel = distanceResponseModelFromJson(jsonString);

import 'dart:convert';

DistanceResponseModel distanceResponseModelFromJson(String str) =>
    DistanceResponseModel.fromJson(json.decode(str));

String distanceResponseModelToJson(DistanceResponseModel data) =>
    json.encode(data.toJson());

class DistanceResponseModel {
  DistanceResponseModel({
    this.destinationAddresses,
    this.originAddresses,
    this.rows,
    this.status,
  });

  List<String> destinationAddresses;
  List<String> originAddresses;
  List<Row> rows;
  String status;

  DistanceResponseModel copyWith({
    List<String> destinationAddresses,
    List<String> originAddresses,
    List<Row> rows,
    String status,
  }) =>
      DistanceResponseModel(
        destinationAddresses: destinationAddresses ?? this.destinationAddresses,
        originAddresses: originAddresses ?? this.originAddresses,
        rows: rows ?? this.rows,
        status: status ?? this.status,
      );

  factory DistanceResponseModel.fromJson(Map<String, dynamic> json) =>
      DistanceResponseModel(
        destinationAddresses: json["destination_addresses"] == null
            ? null
            : List<String>.from(json["destination_addresses"].map((x) => x)),
        originAddresses: json["origin_addresses"] == null
            ? null
            : List<String>.from(json["origin_addresses"].map((x) => x)),
        rows: json["rows"] == null
            ? null
            : List<Row>.from(json["rows"].map((x) => Row.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "destination_addresses": destinationAddresses == null
            ? null
            : List<dynamic>.from(destinationAddresses.map((x) => x)),
        "origin_addresses": originAddresses == null
            ? null
            : List<dynamic>.from(originAddresses.map((x) => x)),
        "rows": rows == null
            ? null
            : List<dynamic>.from(rows.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class Row {
  Row({
    this.elements,
  });

  List<Element> elements;

  Row copyWith({
    List<Element> elements,
  }) =>
      Row(
        elements: elements ?? this.elements,
      );

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        elements: json["elements"] == null
            ? null
            : List<Element>.from(
                json["elements"].map((x) => Element.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "elements": elements == null
            ? null
            : List<dynamic>.from(elements.map((x) => x.toJson())),
      };
}

class Element {
  Element({
    this.distance,
    this.duration,
    this.status,
  });

  Distance distance;
  Distance duration;
  String status;

  Element copyWith({
    Distance distance,
    Distance duration,
    String status,
  }) =>
      Element(
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        status: status ?? this.status,
      );

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        distance: json["distance"] == null
            ? null
            : Distance.fromJson(json["distance"]),
        duration: json["duration"] == null
            ? null
            : Distance.fromJson(json["duration"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance == null ? null : distance.toJson(),
        "duration": duration == null ? null : duration.toJson(),
        "status": status == null ? null : status,
      };
}

class Distance {
  Distance({
    this.text,
    this.value,
  });

  String text;
  int value;

  Distance copyWith({
    String text,
    int value,
  }) =>
      Distance(
        text: text ?? this.text,
        value: value ?? this.value,
      );

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        text: json["text"] == null ? null : json["text"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "value": value == null ? null : value,
      };
}
