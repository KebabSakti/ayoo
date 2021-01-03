import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoShoppingCart extends GetView<ShoppingCartController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    FontAwesomeIcons.shoppingBag,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 6,
          top: 10,
          child: Obx(
            () => TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: 0.0,
                  end: (controller.totalItem.value > 0) ? 1.0 : 0.0),
              duration: Duration(milliseconds: 200),
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${controller.totalItem.value}',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
