import 'package:ayoo/controller/google_place_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/delivery_detail_model.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:ayoo/model/shopping_cart_model.dart';
import 'package:ayoo/repo/remote/mitra_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeliveryDetailPageController extends GetxController {
  GoogleMapController mapController;
  final MitraApi _mitraApi = MitraApi();
  final GooglePlaceController googlePlaceController = Get.find();
  final PanelController suggestionPanel = PanelController();
  final TextEditingController searchField = TextEditingController();
  final HelperInstance helper = HelperInstance();
  final List<String> itemTypes = Get.arguments;

  Future _zoomToDeviceLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _moveMapCamera(LatLng(position.latitude, position.longitude));
  }

  void _moveMapCamera(LatLng latLng) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: (latLng),
          zoom: 16,
        ),
      ),
    );
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
    Future.delayed(Duration(seconds: 1), () {
      setPanelPosition(suggestionPanel, 1.0);
    });
  }

  void setPanelPosition(PanelController panel, double pos) {
    panel.animatePanelToPosition(
      pos,
      duration: Duration(milliseconds: 150),
    );
  }

  Future fetchNearestMitra(String placeId) async {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.grey[100],
                valueColor:
                    AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Loading..',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );

    await googlePlaceController
        .getDetailsByPlaceId(placeId)
        .then((result) async {
      await _mitraApi
          .fetchNearesMitra(
              itemTypes,
              LatLng(result.result.geometry.location.lat,
                  result.result.geometry.location.lng))
          .then((mitras) {
        if (mitras != null) {
          var idSet = <String>{};
          var details = <DeliveryDetailModel>[];

          for (var item in mitras) {
            if (idSet.add(item.deliveryTypeId)) {
              details.add(DeliveryDetailModel(
                deliveryTypeModel: [item.deliveryTypeModel],
                mitraModel: [item],
                description: result.result.formattedAddress,
                distance: item.distance.toString(),
                fee: item.ongkir.toString(),
              ));
            }
          }

          Get.back(result: details, closeOverlays: true);
        }
      });
    });
  }

  void init() {
    searchField.addListener(() {
      googlePlaceController.setKeyword(searchField.text);
    });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
