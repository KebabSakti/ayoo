import 'package:ayoo/model/auth_model.dart';
import 'package:ayoo/repo/remote/auth_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final _authApi = AuthApi();

  var authModel = AuthModel(userId: "", token: "").obs;
  var error = false.obs;

  Future<AuthModel> requestGuestAccess() async {
    error.value = false;

    final prefs = await SharedPreferences.getInstance();

    if ((prefs.getString('token') ?? "").isEmpty) {
      await _authApi.requestGuestAccess().then((auth) {
        if (auth != null) {
          prefs.setString('token', auth.token);
          prefs.setString('user_id', auth.userId);
          authModel.value = auth;
        } else {
          error.value = true;
        }
      });
    } else {
      authModel(AuthModel(
        userId: prefs.getString('user_id'),
        token: prefs.getString('token'),
      ));
    }

    return authModel.value;
  }
}
