import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoBottomNavigationBarItem extends StatelessWidget {
  final double width;
  final IconData icon;
  final String text;
  final Color color;
  final bool notification;
  final Function onTap;

  AyoBottomNavigationBarItem({
    @required this.width,
    @required this.icon,
    @required this.text,
    @required this.color,
    @required this.notification,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(56),
          child: InkWell(
            onTap: onTap,
            splashColor: Get.theme.accentColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(56),
            child: Ink(
              width: width,
              padding: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    icon,
                    color: color,
                    size: 18,
                  ),
                  SizedBox(height: 4),
                  Text(
                    text,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 5,
          child: ClipOval(
            child: Container(
              width: 10,
              height: 10,
              color: (notification) ? Colors.red : Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
