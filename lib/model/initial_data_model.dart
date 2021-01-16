// To parse this JSON data, do
//
//     final initialDataModel = initialDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:ayoo/model/intro_image_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';

InitialDataModel initialDataModelFromJson(String str) =>
    InitialDataModel.fromJson(json.decode(str));

String initialDataModelToJson(InitialDataModel data) =>
    json.encode(data.toJson());

class InitialDataModel {
  InitialDataModel({
    this.introImageModel,
    this.shoppingCartModel,
  });

  List<IntroImageModel> introImageModel;
  List<ShoppingCartModel> shoppingCartModel;

  factory InitialDataModel.fromJson(Map<String, dynamic> json) =>
      InitialDataModel(
        introImageModel: List<IntroImageModel>.from(
            json["intro_image_model"].map((x) => IntroImageModel.fromJson(x))),
        shoppingCartModel: List<ShoppingCartModel>.from(
            json["shopping_cart_model"]
                .map((x) => ShoppingCartModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "intro_image_model":
            List<dynamic>.from(introImageModel.map((x) => x.toJson())),
        "shopping_cart_model":
            List<dynamic>.from(shoppingCartModel.map((x) => x.toJson())),
      };
}
