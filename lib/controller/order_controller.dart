import 'package:ayoo/controller/app_page_controller.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:ayoo/repo/remote/order_api.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderApi _orderApi = OrderApi();
  final AppPageController _appPageController = Get.find();

  final loading = false.obs;
  final _orders = List<OrderModel>().obs;

  Future fetchOrder() async {
    loading(true);
    await _orderApi.fetchOrder().then((result) {
      if (result != null) {
        setOrders(result);
        loading(false);
      }
    });
  }

  Future resetRequestQueue(String saleId) async {
    await _orderApi.resetRequestQueue(saleId: saleId);
  }

  void setOrders(List<OrderModel> orders) {
    _showNotif(orders);
    _orders.assignAll(orders);
  }

  List<OrderModel> _filterOrder(String filter) {
    return _orders
        .where((order) => order.orderStatusModel[0].status == filter)
        .toList();
  }

  List<OrderModel> get pendingOrder => _filterOrder('Pending');

  List<OrderModel> get selesaiOrder => _filterOrder('Selesai');

  List<OrderModel> get batalOrder => _filterOrder('Batal');

  void _showNotif(List<OrderModel> orders) {
    var mOrders = orders
        .where((order) => order.orderStatusModel[0].status == 'Pending')
        .toList();

    if (mOrders.length > 0) {
      _appPageController.showNotifMenu('Order', true);
    } else {
      _appPageController.showNotifMenu('Order', false);
    }
  }
}
