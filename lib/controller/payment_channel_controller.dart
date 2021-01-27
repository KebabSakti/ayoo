import 'package:ayoo/model/payment_channel_model.dart';
import 'package:ayoo/repo/remote/payment_channel_api.dart';
import 'package:get/get.dart';

class PaymentChannelController extends GetxController {
  final _paymentChannelApi = PaymentChannelApi();

  final _paymentChannels = List<PaymentChannelModel>().obs;
  final _selectedPayment = PaymentChannelModel().obs;
  final loading = false.obs;
  final error = false.obs;

  List<PaymentChannelModel> get paymentChannels => _paymentChannels;

  void setPaymentChannel(List<PaymentChannelModel> paymentChannels) {
    _paymentChannels.assignAll(paymentChannels);
  }

  PaymentChannelModel get selectedPayment => _selectedPayment.value;

  void setPayment(PaymentChannelModel payment) {
    _selectedPayment.value = payment;
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
    _fetchPaymentChannel();

    super.onInit();
  }
}
