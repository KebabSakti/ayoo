import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/model/auth_model.dart';
import 'package:ayoo/model/customer_model.dart';
import 'package:ayoo/repo/remote/auth_api.dart';
import 'package:flutter/material.dart';
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
      await _authApi.requestGuestAccess().then((auth) async {
        if (auth != null) {
          await prefs.setString('token', auth.token);
          await prefs.setString('user_id', auth.userId);
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

  Future<CustomerModel> register({
    @required String name,
    @required String phone,
    @required String password,
  }) async {
    return await _authApi
        .register(name: name, phone: phone, password: password)
        .then((result) async {
      if (result != null) {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('token', result.token);
        await prefs.setString('user_id', result.userId);

        authModel(AuthModel(
          token: result.token,
          userId: result.userId,
        ));

        return result;
      }

      return null;
    });
  }

  Future<CustomerModel> login({
    @required String phone,
    @required String password,
  }) async {
    return await _authApi
        .login(phone: phone, password: password)
        .then((result) async {
      if (result != null) {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('token', result.token);
        await prefs.setString('user_id', result.userId);

        authModel(AuthModel(
          token: result.token,
          userId: result.userId,
        ));

        return result;
      }

      return null;
    });
  }

  Future logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', '');
    await prefs.setString('user_id', '');

    Get.offAllNamed('/');
  }
}
