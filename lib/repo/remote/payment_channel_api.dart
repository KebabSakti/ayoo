import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/payment_channel_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PaymentChannelApi {
  final _dio = Get.find<DioInstance>();

  Future<List<PaymentChannelModel>> fetchPaymentChannel() async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('paymentchannel/fetch');

      return paymentChannelModelFromJson(response.data);
    } on DioError catch (_) {
      return null;
    }
  }
}
