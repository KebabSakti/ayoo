import 'package:ayoo/model/intro_image_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroBannerController extends GetxController {
  final intros = List<IntroImageModel>().obs;

  Future setIntros(List<IntroImageModel> mIntros) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro', true);

    intros.assignAll(mIntros);
  }
}
