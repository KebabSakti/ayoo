import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/repo/remote/fcm_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FcmController extends GetxController {
  final FcmApi _fcmApi = FcmApi();

  final HelperInstance helper = Get.find();
  final CustomerController _customerController = Get.find();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future registerNotificationChannel() async {
    MethodChannel _channel = MethodChannel('ayobelanja.com/default_channel');

    Map<String, String> _channelMap = {
      "id": "DEFAULT_NOTIFICATION_CHANNEL",
      "name": "Default Notification",
      "description": "Handle all notification in the app",
    };

    try {
      await _channel.invokeMethod('createNotificationChannel', _channelMap);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future registerFcmToken() async {
    if (_customerController.customer.fcmToken == null) {
      //register token to db and return it
      await _firebaseMessaging.getToken().then((token) {
        _customerController.setCustomer(
            _customerController.customer.copyWith(fcmToken: token));
        //send to db
        _fcmApi.registerFcmToken(fcmToken: token);
      });
    }
  }

  Future handleFcmMessages() async {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> payload) async {
        print("onMessage: $payload");
        _fcmHandler(payload);
      },
      onLaunch: (Map<String, dynamic> payload) async {
        print("onLaunch: $payload");
        _fcmHandler(payload);
      },
      onResume: (Map<String, dynamic> payload) async {
        print("onResume: $payload");
        _fcmHandler(payload);
      },
    );
  }

  void _fcmHandler(Map<String, dynamic> payload) {
    var target = payload['data']['target'];
    switch (target) {
      case 'reset_courier_search':
        Get.toNamed('/reset_courier_search_page', arguments: payload['data']);
        break;

      case 'courier_accept_order':
        Get.toNamed('/courier_accept_order_page', arguments: payload['data']);
        break;
    }
  }

  void init() async {
    await registerNotificationChannel();
    await registerFcmToken();
    await handleFcmMessages();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
