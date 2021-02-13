import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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

  String parseDate(DateTime date, {DateFormat dateFormat}) {
    var mDate = date.toLocal();

    return (dateFormat != null) ? dateFormat.format(mDate) : mDate.toString();
  }

  void loading({String text = 'Loading..'}) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.grey[100],
                valueColor:
                    AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
              ),
            ),
            SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
