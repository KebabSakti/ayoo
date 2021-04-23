import 'package:ayoo/controller/google_place_controller.dart';
import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/delivery_mitra_model.dart';
import 'package:ayoo/model/delivery_type_model.dart';
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

  dynamic calculateShippingFee(
      DeliveryTypeModel deliveryTypeModel, dynamic distance) {
    if (deliveryTypeModel.instant > 0) {
      if (distance <= 0) {
        return 5000;
      } else {
        return (distance / 1000) * 5000;
      }
    } else {
      return 10000;
    }
  }

  List<MitraModel> filterMitra(List<MitraModel> mitras) {
    var mMitras = [];
    mitras.forEach((i) {
      var courierOnline =
          i.courierModel.where((e) => e.status == 'Online').length;

      if (courierOnline > 0) {
        mMitras.add(i);
      }
    });

    var idSet = <String>{};
    var details = <MitraModel>[];

    for (var item in mMitras) {
      if (idSet.add(item.deliveryTypeId)) {
        details.add(item);
      }
    }

    return details;
  }

  Future<List<MitraModel>> fetchNearestMitra(LatLng latLng) async {
    return await _mitraApi.fetchNearesMitra(itemTypes, latLng);
  }

  Future selectPlaceSuggestion(String placeId) async {
    helper.loading();

    List<DeliveryMitraModel> deliveryMitras = [];

    var placeDetailResult =
        await googlePlaceController.getDetailsByPlaceId(placeId);

    var mitras = await fetchNearestMitra(LatLng(
      placeDetailResult.result.geometry.location.lat,
      placeDetailResult.result.geometry.location.lng,
    ));

    var filteredMitras = filterMitra(mitras);

    await Future.forEach(filteredMitras, (item) async {
      var destination = Location(placeDetailResult.result.geometry.location.lat,
          placeDetailResult.result.geometry.location.lng);
      var origin = Location(double.parse(item.lat), double.parse(item.lng));

      print('DESTINATION : ' +
          destination.lat.toString() +
          ', ' +
          destination.lng.toString());

      print('ORIGIN : ' + origin.lat.toString() + ', ' + origin.lng.toString());

      await googlePlaceController
          .distanceWithLocation([origin], [destination]).then((distance) {
        deliveryMitras.add(DeliveryMitraModel(
          mitraModel: item,
          distance: distance.results[0].elements[0].distance.value,
          distanceText: distance.results[0].elements[0].distance.text,
          duration: distance.results[0].elements[0].duration.value,
          durationText: distance.results[0].elements[0].duration.text,
          fee: calculateShippingFee(item.deliveryTypeModel,
                  distance.results[0].elements[0].distance.value)
              .toString(),
          originLat: origin.lat.toString(),
          originLng: origin.lng.toString(),
          destLat: destination.lat.toString(),
          destLng: destination.lng.toString(),
        ));
      });
    });

    Get.back(result: [deliveryMitras, placeDetailResult], closeOverlays: true);
  }

  void init() {
    searchField.addListener(() {
      googlePlaceController.setKeyword(searchField.text);
    });

    ever(manualSelect, (_) => selectPlaceModeToggle());
  }

  void close() {
    mapController.dispose();
    searchField.dispose();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onClose() {
    close();
    super.onClose();
  }
}
