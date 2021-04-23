import 'package:ayoo/model/courier_model.dart';

class CourierRequestModel {
  String request;
  CourierModel courierModel;
  DateTime timestamps;

  CourierRequestModel({
    this.request,
    this.courierModel,
    this.timestamps,
  });
}
