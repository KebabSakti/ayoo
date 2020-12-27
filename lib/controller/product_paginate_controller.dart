import 'package:ayoo/model/product_paginate_model.dart';
import 'package:get/get.dart';

class ProductPaginateController extends GetxController {
  var productPaginateModel = ProductPaginateModel().obs;

  Future setProductPaginateModel(ProductPaginateModel productPaginate) async {
    productPaginateModel.value = productPaginate;
  }
}
