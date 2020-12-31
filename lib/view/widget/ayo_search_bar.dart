import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoSearchBar extends StatelessWidget {
  final String hint;

  AyoSearchBar({this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 10),
            child: Icon(
              FontAwesomeIcons.search,
              color: Colors.grey,
              size: 16,
            ),
          ),
          Container(
            child: Text(
              hint ?? 'Cari di sini',
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
