import 'package:ayoo/controller/customer_controller.dart';
import 'package:ayoo/controller/fcm_controller.dart';
import 'package:ayoo/model/courier_model.dart';
import 'package:ayoo/model/courier_request_model.dart';
import 'package:ayoo/model/delivery_mitra_model.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:ayoo/repo/remote/courier_api.dart';
import 'package:get/get.dart';

class FindCourierPageController extends GetxController {
  final CourierApi _courierApi = CourierApi();
  final OrderModel order = Get.arguments;

  final CustomerController _customerController = Get.find();
  final FcmController _fcmController = Get.find();

  final statusMessage = ''.obs;
  int retry = 0;

  Future findCourier({CourierModel courier}) async {
    await _courierApi.find(
      customerId: _customerController.customer.userId,
      courierToken: courier.fcmToken,
    );
  }

  DeliveryMitraModel getMitra() {
    return order.deliveryMitraModel.firstWhere(
        (item) => item.mitraModel.deliveryTypeModel.instant > 0,
        orElse: () => null);
  }

  void _courierRequestAction(CourierRequestModel courierRequestModel) async {
    switch (courierRequestModel.request) {
      case 'accept':
        //update order record and navigate to courier display
        OrderModel orderModel = order.copyWith();
        break;

      case 'decline':
        retry += 1;
        var couriersCount = getMitra().mitraModel.courierModel.length - 1;
        if (retry <= couriersCount) {
          Future.delayed(Duration(seconds: retry), () {
            print('PERCOBAAN KE $retry');

            findCourier(courier: getMitra().mitraModel.courierModel[retry]);
          });
        }
    }
  }

  void _init() {
    findCourier(courier: getMitra().mitraModel.courierModel[retry]);

    ever(_fcmController.courierRequest,
        (CourierRequestModel courierRequestModel) {
      _courierRequestAction(courierRequestModel);
    });
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
