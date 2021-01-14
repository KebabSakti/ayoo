import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AyoCartItemControl extends StatelessWidget {
  final TextEditingController qtyField;
  final Function plus;
  final Function minus;
  final Function change;

  AyoCartItemControl({
    this.qtyField,
    this.plus,
    this.minus,
    this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: FlatButton(
            onPressed: minus,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.grey[50],
            child: FaIcon(
              FontAwesomeIcons.minus,
              size: 20,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(width: 4),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey[50],
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: qtyField,
            textAlign: TextAlign.center,
            showCursor: false,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(3),
            ],
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) => change,
          ),
        ),
        SizedBox(width: 4),
        SizedBox(
          width: 50,
          height: 50,
          child: FlatButton(
            onPressed: plus,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.grey[50],
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 20,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
