import 'package:ayoo/controller/scroll_to_top_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoScrollToTopButton extends StatelessWidget {
  final ScrollController scrollController;

  AyoScrollToTopButton({@required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ScrollToTopButtonController(scrollController: scrollController),
      builder: (controller) => Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween<double>(
                begin: 0.0,
                end: controller.scrollToTopButtonTweenEndValue.value,
              ),
              duration: Duration(milliseconds: 300),
              builder: (context, scale, child) => Transform.scale(
                scale: scale,
                child: child,
              ),
              child: ClipOval(
                child: Material(
                  color: Get.theme.primaryColor.withOpacity(0.8),
                  child: InkWell(
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Icon(
                        FontAwesomeIcons.arrowUp,
                        size: 18,
                      ),
                    ),
                    onTap: () {
                      controller.scrollToTop();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
