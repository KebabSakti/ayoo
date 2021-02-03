import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MitraApi {
  final DioInstance _dio = Get.find();

  Future<List<MitraModel>> fetchNearesMitra(
      List<String> types, LatLng latLng) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('mitra/nearest',
              data: d.FormData.fromMap({
                'lat': latLng.latitude,
                'lng': latLng.longitude,
                'delivery_type_id': types.toList(),
              }));

      return mitraModelFromJson(response.data);
    } on d.DioError catch (_) {
      return null;
    }
  }
}
