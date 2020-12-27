import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/search_model.dart';
import 'package:ayoo/model/search_query.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SearchApi {
  final _dio = Get.find<DioInstance>();

  Future<List<SearchModel>> search({@required SearchQuery searchQuery}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('search', data: {
        'keyword': searchQuery.keyword,
        'history': searchQuery.history,
      });

      return searchModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
