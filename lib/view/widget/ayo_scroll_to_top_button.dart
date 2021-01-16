import 'package:ayoo/controller/scroll_to_top_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AyoScrollToTopButton extends StatelessWidget {
  final ScrollController scrollController;
  final String tag;

  AyoScrollToTopButton({
    @required this.scrollController,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ScrollToTopButtonController(scrollController: scrollController),
      tag: tag,
      builder: (controller) => Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => TweenAnimationBuilder(
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 300),
              tween: Tween<double>(
                begin: 0.0,
                end: controller.scrollToTopButtonTweenEndValue.value,
              ),
              child: GestureDetector(
                child: Opacity(
                  opacity: 0.8,
                  child: SvgPicture.asset(
                    'assets/images/arrow-up.svg',
                    width: 45,
                    height: 45,
                  ),
                ),
                onTap: () {
                  controller.scrollToTop();
                },
              ),
              builder: (context, scale, child) => Transform.scale(
                scale: scale,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
