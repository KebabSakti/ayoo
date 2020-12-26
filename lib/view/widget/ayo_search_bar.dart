import 'package:flutter/material.dart';

class AyoSearchBar extends StatelessWidget {
  final String hint;

  AyoSearchBar({this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
          SizedBox(width: 5),
          Container(
            child: Text(
              hint ?? 'Cari di sini',
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ),
          )
        ],
      ),
    );
  }
}
