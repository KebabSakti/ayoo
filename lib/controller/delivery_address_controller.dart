import 'package:ayoo/model/delivery_address_model.dart';
import 'package:ayoo/repo/remote/delivery_address_api.dart';
import 'package:get/get.dart';

class DeliveryAddressController extends GetxController {
  final DeliveryAddressApi _deliveryAddressApi = DeliveryAddressApi();

  RxList<DeliveryAddressModel> addresses = List<DeliveryAddressModel>().obs;

  Future<List<DeliveryAddressModel>> add(DeliveryAddressModel datas) async {
    var address = await _deliveryAddressApi.addDeliveryAddress(datas);
    addresses.assignAll(address);

    return address;
  }

  Future<List<DeliveryAddressModel>> edit(
      DeliveryAddressModel datas, String id) async {
    var address = await _deliveryAddressApi.updateDeliveryAddress(datas, id);
    addresses.assignAll(address);

    return address;
  }

  Future<List<DeliveryAddressModel>> delete(DeliveryAddressModel datas) async {
    var address = await _deliveryAddressApi.deleteDeliveryAddress(datas);
    addresses.assignAll(address);

    return address;
  }
}
