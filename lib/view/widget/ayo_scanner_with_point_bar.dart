import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    icon: SvgPicture.asset('assets/images/qr.svg', width: 20),
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
                    Text(
                      '9999',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset('assets/images/coin-rp.svg', width: 20),
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
