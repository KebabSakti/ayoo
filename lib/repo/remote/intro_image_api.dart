import 'package:ayoo/controller/initial_page_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/intro_image_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ayoo/controller/initial_page_controller.dart';

class IntroImageApi {
  final _dio = Get.find<DioInstance>();

  Future<List<IntroImageModel>> fetchIntroImages() async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<InitialPageController>().authModel.value)
          .post('intro_slider');

      return introImageModelFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<String>> downloadImage(List<IntroImageModel> introImages) async {
    try {
      var images = [];

      introImages.forEach((item) async {
        var path = (await getTemporaryDirectory()).path + "${item.introId}.jpg";
        await _dio.dio.download(item.url, path);
        images.add(path);
      });

      return images;
    } on DioError catch (e) {
      return null;
    }
  }
}
