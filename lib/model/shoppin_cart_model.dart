import 'dart:convert';

import 'package:ayoo/model/product_model.dart';

List<ShoppingCartModel> shoppingCartModelFromJson(String str) =>
    List<ShoppingCartModel>.from(
        json.decode(str).map((x) => ShoppingCartModel.fromJson(x)));

String shoppingCartModelToJson(List<ShoppingCartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        product: product ?? this.product,
      );

  factory ShoppingCartModel.fromJson(Map<String, dynamic> json) =>
      ShoppingCartModel(
        id: json["id"],
        cartId: json["cart_id"],
        userId: json["user_id"],
        checked: json["checked"],
        productId: json["product_id"],
        price: json["price"],
        qty: json["qty"],
        total: json["total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: ProductModel.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cart_id": cartId,
        "user_id": userId,
        "checked": checked,
        "product_id": productId,
        "price": price,
        "qty": qty,
        "total": total,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}
