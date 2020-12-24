import 'package:ayoo/model/intro_image_model.dart';
import 'package:ayoo/repo/remote/intro_image_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroController extends GetxController {
  final _introImageApi = IntroImageApi();

  var error = false.obs;
  var images = List<IntroImageModel>().obs;

  Future fetchIntroImage() async {
    error.value = false;

    final prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool('intro') ?? false) == false) {
      var introImages = await _introImageApi.fetchIntroImages();
      if (introImages != null) {
        images.assignAll(introImages);
        prefs.setBool('intro', true);

        _navigateTo('/intro');
      } else {
        error.value = true;
      }
    } else {
      _navigateTo('/app');
    }
  }

  void _navigateTo(String page) {
    Get.offAllNamed(page);
  }
}
