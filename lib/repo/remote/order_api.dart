import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/instance/dio_instance.dart';
import 'package:ayoo/model/order_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderApi {
  final DioInstance _dio = Get.find();

  Future<List<OrderModel>> fetchOrder() async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('order/fetch');

      return orderModelFromJson(response.data);
    } on d.DioError catch (_) {
      return null;
    }
  }

  Future<List<OrderModel>> createOrder({@required OrderModel order}) async {
    try {
      var response = await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post(
            'order/create',
            data: d.FormData.fromMap({
              'payment_channel_id': order.paymentChannelModel.channelCode,
              'delivery_address_id':
                  order.deliveryAddressModel.deliveryAddressId,
              'map_address': order.mapAddress,
              'shop_total': order.shopTotal,
              'delivery_total': order.deliveryTotal,
              'admin_fee_total': order.adminFeeTotal,
              'sub_total': order.total,
              'total': order.total,
              'channel_code': order.paymentChannelModel.channelCode,
              'channel_category': order.paymentChannelModel.channelCategory,
              'phone': order.deliveryAddressModel.phone,
              'mitras': order.deliveryMitraModel
                  .map((item) => {
                        'mitra_id': item.mitraModel.mitraId,
                        'instant': item.mitraModel.instant,
                        'distance': item.distance,
                        'distance_text': item.distanceText,
                        'duration': item.duration,
                        'duration_text': item.durationText,
                        'fee': item.fee,
                        'origin_lat': item.originLat,
                        'origin_lng': item.originLng,
                        'dest_lat': item.destLat,
                        'dest_lng': item.destLng,
                      })
                  .toList(),
              'items': order.orderDetailModel
                  .map((item) => {
                        'product_id': item.product.productId,
                        'note': item.note ?? '',
                        'qty': item.qty,
                        'total': item.total,
                      })
                  .toList(),
            }),
          );

      return orderModelFromJson(response.data);
    } on d.DioError catch (_) {
      return null;
    }
  }

  Future resetRequestQueue({@required String saleId}) async {
    try {
      await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('order/reset', data: {'sale_id': saleId});
    } on d.DioError catch (_) {
      return null;
    }
  }

  Future addOrderQueue({@required OrderModel order}) async {
    try {
      await _dio
          .withAuth(auth: Get.find<AuthController>().authModel.value)
          .post('order/queue', data: {
        'sale_id': order.saleId,
        'mitra_id': order.deliveryMitraModel[0].mitraId,
      });

      return true;
    } on d.DioError catch (_) {
      return null;
    }
  }
}
