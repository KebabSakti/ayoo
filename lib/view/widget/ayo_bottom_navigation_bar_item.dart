import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoBottomNavigationBarItem extends StatelessWidget {
  final double width;
  final IconData icon;
  final String text;
  final int index;
  final int active;
  final Function onTap;

  AyoBottomNavigationBarItem({
    @required this.width,
    @required this.icon,
    @required this.text,
    @required this.index,
    @required this.active,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var _color = (active == index) ? Get.theme.primaryColor : Colors.grey[500];
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(56),
      child: InkWell(
        onTap: onTap,
        splashColor: Theme.of(context).accentColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(56),
        child: Ink(
          width: width,
          padding: EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                color: _color,
                size: 18,
              ),
              SizedBox(height: 4),
              Text(
                text,
                style: TextStyle(
                  color: _color,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
