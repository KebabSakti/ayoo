import 'package:ayoo/model/payment_channel_model.dart';
import 'package:ayoo/repo/remote/payment_channel_api.dart';
import 'package:get/get.dart';

class PaymentChannelController extends GetxController {
  final _paymentChannelApi = PaymentChannelApi();

  final _paymentChannels = List<PaymentChannelModel>().obs;
  final loading = false.obs;
  final error = false.obs;

  List<PaymentChannelModel> get paymentChannels => _paymentChannels;

  PaymentChannelModel get defaultPayment =>
      _paymentChannels.firstWhere((item) => item.isDefault > 0);

  void setPaymentChannel(List<PaymentChannelModel> paymentChannels) {
    _paymentChannels.assignAll(paymentChannels);
  }

  Future _fetchPaymentChannel() async {
    loading.value = true;
    error.value = false;

    await _paymentChannelApi.fetchPaymentChannel().then((result) {
      if (result != null) {
        result.firstWhere((item) => item.isDefault > 0);
        setPaymentChannel(result);
      } else {
        error.value = true;
      }

      loading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
