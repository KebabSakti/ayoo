import 'dart:convert';

CourierModel courierModelFromJson(String str) =>
    CourierModel.fromJson(json.decode(str));

String courierModelToJson(CourierModel data) => json.encode(data.toJson());

class CourierModel {
  CourierModel({
    this.id,
    this.courierId,
    this.mitraId,
    this.name,
    this.phone,
    this.password,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String courierId;
  String mitraId;
  String name;
  String phone;
  String password;
  int active;
  DateTime createdAt;
  DateTime updatedAt;

  CourierModel copyWith({
    int id,
    String courierId,
    String mitraId,
    String name,
    String phone,
    String password,
    int active,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      CourierModel(
        id: id ?? this.id,
        courierId: courierId ?? this.courierId,
        mitraId: mitraId ?? this.mitraId,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CourierModel.fromJson(Map<String, dynamic> json) => CourierModel(
        id: json["id"] == null ? null : json["id"],
        courierId: json["courier_id"] == null ? null : json["courier_id"],
        mitraId: json["mitra_id"] == null ? null : json["mitra_id"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        password: json["password"] == null ? null : json["password"],
        active: json["active"] == null ? null : json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "courier_id": courierId == null ? null : courierId,
        "mitra_id": mitraId == null ? null : mitraId,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "password": password == null ? null : password,
        "active": active == null ? null : active,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
