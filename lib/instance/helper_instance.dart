import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class HelperInstance {
  String formatMoney(var number, {String locale, String name, int digit}) {
    var f = NumberFormat.currency(
      locale: locale ?? 'id_ID',
      name: name ?? 'Rp ',
      decimalDigits: digit ?? 0,
    );
    return f.format(number);
  }

  void showToast(String message, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  String placeName(String description) {
    return description.substring(0, description.indexOf(','));
  }
}
