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
}
