import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoHomeSection extends StatelessWidget {
  final double height;
  final String heading;
  final String tapText;
  final IconData icon;
  final Function onTap;
  final Widget child;

  const AyoHomeSection({
    this.height,
    this.heading,
    this.tapText,
    this.icon = Icons.arrow_right,
    this.onTap,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    heading,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tapText,
                        style: TextStyle(
                          fontSize: 10,
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        icon,
                        size: 15,
                        color: Get.theme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
