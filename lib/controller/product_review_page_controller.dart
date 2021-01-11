import 'package:ayoo/model/rating_model.dart';
import 'package:ayoo/model/rating_weight_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductReviewPageController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final RatingWeightModel ratingWeight = Get.arguments.ratingWeightModel;
  final ratings = List<RatingModel>().obs;
  final filter = 0.obs;

  void setRatingList(List<RatingModel> list) {
    ratings.assignAll(list);
  }

  void setFilter(int value) {
    if (value > 0) {
      setRatingList(Get.arguments.ratingModel
          .where((i) => i.star == value.toString())
          .toList());
    } else {
      setRatingList(Get.arguments.ratingModel);
    }
    filter.value = value;
  }

  @override
  void onInit() {
    setRatingList(Get.arguments.ratingModel);
    super.onInit();
  }
}
