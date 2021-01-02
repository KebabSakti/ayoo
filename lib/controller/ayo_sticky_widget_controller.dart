import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AyoStickyWidgetController extends GetxController {
  final ScrollController scrollController;
  final double stickyPosition;

  AyoStickyWidgetController({
    @required this.scrollController,
    @required this.stickyPosition,
  });

  final show = false.obs;

  void _scrollListener() {
    // print(scrollController.offset);
    show.value = (scrollController.offset >= stickyPosition);
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
