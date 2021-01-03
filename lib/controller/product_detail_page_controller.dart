import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/product_info_model.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/model/rating_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductDetailPageController extends GetxController {
  final HelperInstance helper = Get.find();

  final ScrollController scrollController = ScrollController();
  final PanelController panelController = PanelController();

  final ProductModel product = Get.arguments;
  final List<ProductInfoModel> productInfos = Get.arguments.productInfoModel;
  final List<RatingModel> ratings = Get.arguments.ratingModel;

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
