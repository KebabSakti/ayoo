import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoHomeSectionHeading extends StatelessWidget {
  final String heading;
  final Function onTap;

  const AyoHomeSectionHeading({
    @required this.heading,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                'Lihat Semua',
                style: TextStyle(
                  fontSize: 10,
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_right,
                size: 15,
                color: Get.theme.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
