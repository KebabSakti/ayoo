import 'package:ayoo/controller/ayo_sticky_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoStickyWidget extends StatelessWidget {
  final ScrollController scrollController;
  final double stickyPosition;
  final Widget child;
  final String tag;

  AyoStickyWidget({
    @required this.scrollController,
    @required this.stickyPosition,
    @required this.child,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AyoStickyWidgetController(
        scrollController: scrollController,
        stickyPosition: stickyPosition,
      ),
      tag: tag,
      builder: (controller) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 56),
          child: Obx(
            () => (controller.show.value) ? child : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
