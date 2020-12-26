import 'package:ayoo/model/auth_model.dart';
import 'package:ayoo/repo/remote/auth_api.dart';
import 'package:ayoo/repo/remote/intro_image_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPageController extends GetxController {
  final _authApi = AuthApi();
  final _introImageApi = IntroImageApi();

  var authModel = AuthModel(userId: "", token: "").obs;
  var error = false.obs;

  @override
  void onInit() {
    requestGuestAccess();
    super.onInit();
  }

  Future requestGuestAccess() async {
    error.value = false;

    final prefs = await SharedPreferences.getInstance();

    if ((prefs.getString('token') ?? "").isEmpty) {
      await _authApi.requestGuestAccess().then((auth) {
        if (auth != null) {
          prefs.setString('token', auth.token);
          prefs.setString('user_id', auth.userId);
          authModel.value = auth;

          _fetchIntroImages();
        } else {
          error.value = true;
        }
      });
    } else {
      authModel(AuthModel(
        userId: prefs.getString('user_id'),
        token: prefs.getString('token'),
      ));

      Get.offAllNamed('/app');
    }
  }

  Future _fetchIntroImages() async {
    await _introImageApi.fetchIntroImages().then((images) {
      if (images != null) {
        Get.offAllNamed('/intro', arguments: images);
      } else {
        error.value = true;
      }
    });
  }
}
