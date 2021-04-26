import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  RxBool promo = false.obs;
  RxBool ads = false.obs;

  Future<SharedPreferences> _preferences() async {
    return await SharedPreferences.getInstance();
  }

  void setPromo(bool value) async {
    final prefs = await _preferences();
    await prefs.setBool('notifikasi_promo', value);

    promo(value);
  }

  void setAds(bool value) async {
    final prefs = await _preferences();
    await prefs.setBool('notifikasi_ads', value);

    ads(value);
  }

  void init() async {
    final prefs = await SharedPreferences.getInstance();

    setPromo(prefs.getBool('notifikasi_promo'));
    setAds(prefs.getBool('notifikasi_ads'));
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
