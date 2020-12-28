import 'package:ayoo/controller/app_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoBottomNavigationBarItem extends StatelessWidget {
  final double width;
  final IconData icon;
  final String text;
  final int index;

  AyoBottomNavigationBarItem({
    @required this.width,
    @required this.icon,
    @required this.text,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(56),
      child: InkWell(
        onTap: () => Get.find<AppPageController>().appPageViewNavigateTo(index),
        splashColor: Get.theme.accentColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(56),
        child: Ink(
          width: width,
          padding: EdgeInsets.all(6),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  icon,
                  color:
                      (Get.find<AppPageController>().appPageViewActive.value ==
                              index)
                          ? Get.theme.primaryColor
                          : Colors.grey[500],
                  size: 18,
                ),
                SizedBox(height: 4),
                Text(
                  text,
                  style: TextStyle(
                    color: (Get.find<AppPageController>()
                                .appPageViewActive
                                .value ==
                            index)
                        ? Get.theme.primaryColor
                        : Colors.grey[500],
                    fontSize: 12,
                    fontWeight: (Get.find<AppPageController>()
                                .appPageViewActive
                                .value ==
                            index)
                        ? FontWeight.w800
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
