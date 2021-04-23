import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/courier_request_model.dart';
import 'package:ayoo/repo/remote/fcm_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FcmController extends GetxController {
  final FcmApi _fcmApi = FcmApi();

  final HelperInstance helper = Get.find();
  final CustomerController _customerController = Get.find();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final courierRequest = CourierRequestModel().obs;

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

  void _fcmHandler(Map<String, dynamic> payload) async {
    var target = payload['data']['target'];
    if (target == 'courier_request') {
      await Future.delayed(Duration(milliseconds: 500));
      print("onMessage: $payload");

      // Map<String, dynamic> courier =
      //     await jsonDecode(payload['data']['courier_model']);
      // courierRequest.value = CourierRequestModel(
      //   request: payload['data']['request'],
      //   timestamps: DateTime.parse(payload['data']['timestamps']),
      //   courierModel: CourierModel(
      //     id: courier['id'],
      //     active: courier['active'],
      //     courierId: courier['courier_id'],
      //     fcmToken: courier['fcm_token'],
      //     mitraId: courier['mitra_id'],
      //     name: courier['name'],
      //     phone: courier['phone'],
      //     createdAt: DateTime.parse(courier['created_at']),
      //     updatedAt: DateTime.parse(courier['updated_at']),
      //   ),
      // );
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
