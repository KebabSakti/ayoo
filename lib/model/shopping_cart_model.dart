// To parse this JSON data, do
//
//     final shoppingCartModel = shoppingCartModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/product_model.dart';

ShoppingCartModel shoppingCartModelFromJson(String str) =>
    ShoppingCartModel.fromJson(json.decode(str));

String shoppingCartModelToJson(ShoppingCartModel data) =>
    json.encode(data.toJson());

class ShoppingCartModel {
  ShoppingCartModel({
    this.id,
    this.cartId,
    this.userId,
    this.checked,
    this.productId,
    this.price,
    this.qty,
    this.total,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  int id;
  String cartId;
  String userId;
  int checked;
  String productId;
  String price;
  int qty;
  String total;
  String note;
  DateTime createdAt;
  DateTime updatedAt;
  ProductModel product;

  ShoppingCartModel copyWith({
    int id,
    String cartId,
    String userId,
    int checked,
    String productId,
    String price,
    int qty,
    String total,
    String note,
    DateTime createdAt,
    DateTime updatedAt,
    ProductModel product,
  }) =>
      ShoppingCartModel(
        id: id ?? this.id,
        cartId: cartId ?? this.cartId,
        userId: userId ?? this.userId,
        checked: checked ?? this.checked,
        productId: productId ?? this.productId,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        total: total ?? this.total,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        product: product ?? this.product,
      );

  factory ShoppingCartModel.fromJson(Map<String, dynamic> json) =>
      ShoppingCartModel(
        id: json["id"] == null ? null : json["id"],
        cartId: json["cart_id"] == null ? null : json["cart_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        checked: json["checked"] == null ? null : json["checked"],
        productId: json["product_id"] == null ? null : json["product_id"],
        price: json["price"] == null ? null : json["price"],
        qty: json["qty"] == null ? null : json["qty"],
        total: json["total"] == null ? null : json["total"],
        note: json["note"] == null ? null : json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product: json["product"] == null
            ? null
            : ProductModel.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cart_id": cartId == null ? null : cartId,
        "user_id": userId == null ? null : userId,
        "checked": checked == null ? null : checked,
        "product_id": productId == null ? null : productId,
        "price": price == null ? null : price,
        "qty": qty == null ? null : qty,
        "total": total == null ? null : total,
        "note": note == null ? null : note,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "product": product == null ? null : product.toJson(),
      };
}
