import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/delivery_address_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DeliveryAddressApi {
  final _dio = Get.find<DioInstance>();

  Future<List<DeliveryAddressModel>> fetchDeliveryAddress() async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('deliveryaddress/fetch');

      return deliveryAddressModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<List<DeliveryAddressModel>> addDeliveryAddress(
      DeliveryAddressModel address) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('deliveryaddress/store', data: {
        'title': address.title,
        'name': address.name,
        'phone': address.phone,
        'address': address.address,
      });

      return deliveryAddressModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<List<DeliveryAddressModel>> updateDeliveryAddress(
      DeliveryAddressModel address, String deliveryAddressId) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('deliveryaddress/update/$deliveryAddressId', data: {
        'title': address.title,
        'name': address.name,
        'phone': address.phone,
        'address': address.address,
      });

      return deliveryAddressModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }

  Future<List<DeliveryAddressModel>> deleteDeliveryAddress(
      DeliveryAddressModel address) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('deliveryaddress/delete/${address.deliveryAddressId}');

      return deliveryAddressModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
