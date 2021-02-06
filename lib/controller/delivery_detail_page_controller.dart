import 'package:ayoo/controller/google_place_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/delivery_detail_model.dart';
import 'package:ayoo/model/mitra_model.dart';
import 'package:ayoo/repo/remote/mitra_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeliveryDetailPageController extends GetxController {
  GoogleMapController mapController;
  final MitraApi _mitraApi = MitraApi();
  final GooglePlaceController googlePlaceController = Get.find();
  final PanelController suggestionPanel = PanelController();
  final PanelController manualMapPanel = PanelController();
  final TextEditingController searchField = TextEditingController();
  final HelperInstance helper = HelperInstance();
  final List<String> itemTypes = Get.arguments;

  var manualLocation;

  final manualSelect = false.obs;
  final loading = false.obs;
  final geocodingResult = List<GeocodingResult>().obs;

  bool get manual => manualSelect.value;

  void setManualSelect(bool value) {
    manualSelect.value = value;
  }

  Future _zoomToDeviceLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _moveMapCamera(LatLng(position.latitude, position.longitude));
  }

  void onCameraMovedStarted() {
    loading.value = true;
    setPanelPosition(0.5, panel: manualMapPanel);
  }

  void onCameraIdle() async {
    if (manualMapPanel.panelPosition > 0.0)
      await googlePlaceController
          .reverseGeocoding(manualLocation)
          .then((geocoding) {
        geocodingResult.assignAll(geocoding.results);
        setPanelPosition(1.0, panel: manualMapPanel);
        loading.value = false;
      });
  }

  void onCameraMove(CameraPosition position) {
    manualLocation = position.target;
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
      setPanelPosition(1.0);
    });
  }

  void setPanelPosition(double pos, {PanelController panel}) {
    var p = panel ?? suggestionPanel;
    p.animatePanelToPosition(
      pos,
      duration: Duration(milliseconds: 150),
    );
  }

  void selectPlaceModeToggle() {
    if (manualSelect.value) {
      setPanelPosition(0.0);
      // Future.delayed(Duration(milliseconds: 200),
      //     () => setPanelPosition(1.0, panel: manualMapPanel));
      Future.delayed(Duration(milliseconds: 200), () {
        _zoomToDeviceLocation();
      });
    } else {
      setPanelPosition(0.0, panel: manualMapPanel);
      Future.delayed(Duration(milliseconds: 200), () => setPanelPosition(1.0));
    }
  }

  List<DeliveryDetailModel> filterMitra(
      List<MitraModel> mitras, String address) {
    var idSet = <String>{};
    var details = <DeliveryDetailModel>[];

    for (var item in mitras) {
      if (idSet.add(item.deliveryTypeId)) {
        details.add(DeliveryDetailModel(
          deliveryTypeModel: [item.deliveryTypeModel],
          mitraModel: [item],
          description: address,
          distance: item.distance.toString(),
          fee: item.ongkir.toString(),
        ));
      }
    }
    return details;
  }

  Future<List<MitraModel>> fetchNearestMitra(LatLng latLng) async {
    return await _mitraApi.fetchNearesMitra(itemTypes, latLng);
  }

  Future selectPlaceSuggestion(String placeId) async {
    helper.loading();

    await googlePlaceController
        .getDetailsByPlaceId(placeId)
        .then((result) async {
      await fetchNearestMitra(LatLng(result.result.geometry.location.lat,
              result.result.geometry.location.lng))
          .then((mitras) async {
        // await googlePlaceController.distanceWithLocation([
        //   Location(result.result.geometry.location.lat,
        //       result.result.geometry.location.lng)
        // ], [
        //   Location(result.result.geometry.location.lat,
        //       result.result.geometry.location.lng)
        // ]);

        if (mitras != null) {
          Get.back(
            result: filterMitra(mitras, result.result.formattedAddress),
            closeOverlays: true,
          );
        }
      });
    });
  }

  void init() {
    searchField.addListener(() {
      googlePlaceController.setKeyword(searchField.text);
    });

    ever(manualSelect, (_) => selectPlaceModeToggle());
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
