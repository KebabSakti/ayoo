import 'package:ayoo/model/delivery_type_model.dart';
import 'package:flutter/material.dart';

class AyoDeliveryTypeContainer extends StatelessWidget {
  final DeliveryTypeModel type;

  AyoDeliveryTypeContainer({this.type});

  @override
  Widget build(BuildContext context) {
    var color = (type.instant == 1) ? Colors.green : Colors.amber;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: color,
        ),
      ),
      child: Text(
        (type.instant == 1) ? 'Pengiriman Instan' : 'Pengiriman Terjadwal',
        textAlign: TextAlign.center,
        style:
            TextStyle(fontSize: 8, color: color, fontWeight: FontWeight.w800),
      ),
    );
  }
}
