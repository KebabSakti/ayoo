import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:ayoo/model/place_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GooglePlaceApi {
  final _dio = Get.find<DioInstance>();

  Future<List<PlaceModel>> fetchPlace(String keyword) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('place_suggestion/fetch', data: {
        'keyword': keyword,
      });

      return placeModelFromJson(response.data);
    } on d.DioError catch (_) {
      return null;
    }
  }

  Future storePLace(List<PlaceModel> places) async {
    try {
      await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('place_suggestion/store',
              data: d.FormData.fromMap({
                "item": places
                    .map((e) => {
                          'place_id': e.placeId,
                          'description': e.description,
                        })
                    .toList(),
              }));
    } on d.DioError catch (_) {
      //
    }
  }

  Future<List<MitraModel>> fetchNearesMitra(
      List<String> types, LatLng latLng) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('mitra/nearest');

      return mitraModelFromJson(response.data);
    } on d.DioError catch (_) {
      return null;
    }
  }
}
