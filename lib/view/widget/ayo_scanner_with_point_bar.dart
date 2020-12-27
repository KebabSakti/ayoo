import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AyoScannerWithPointBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Ink(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    splashColor: Theme.of(context).accentColor.withOpacity(0.3),
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {},
                  ),
                  Text(
                    'scan kode promo',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '100',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
