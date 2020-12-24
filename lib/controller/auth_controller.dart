import 'package:ayoo/model/auth_model.dart';
import 'package:ayoo/repo/remote/auth_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final _authApi = AuthApi();

  var error = false.obs;
  var auth = AuthModel(userId: "", token: "").obs;

  @override
  void onInit() {
    requestGuestAccess();
    super.onInit();
  }

  Future requestGuestAccess() async {
    error.value = false;

    final prefs = await SharedPreferences.getInstance();

    //only make guest access request once on first app run
    if ((prefs.getString('token') ?? "").isEmpty) {
      var mAuth = await _authApi.requestGuestAccess();
      if (mAuth != null) {
        await _saveAuthInfo(mAuth);
        auth.value = mAuth;
      } else {
        error.value = true;
      }
    } else {
      auth(AuthModel(
          userId: prefs.getString('user_id'), token: prefs.getString('token')));
    }
  }

  Future _saveAuthInfo(AuthModel mAuth) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', mAuth.userId);
    prefs.setString('token', mAuth.token);
  }
}
