import 'package:flutter/material.dart';

class AyoBottomNavigationBar extends StatelessWidget {
  final List<Widget> items;

  AyoBottomNavigationBar({@required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 0.2,
            offset: Offset(0.0, 1),
          ),
        ],
      ),
      child: Row(
        children: this.items,
      ),
    );
  }
}
