import 'package:ayoo/controller/delivery_detail_page_controller.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:ayoo/view/widget/ayo_sliding_up_panel.dart';
import 'package:ayoo/view/widget/ayo_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryDetailPage extends GetView<DeliveryDetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomControlsEnabled: false,
            compassEnabled: false,
            onCameraMoveStarted: () {},
            onCameraIdle: () {},
            onCameraMove: (position) {},
            initialCameraPosition: CameraPosition(
              target: LatLng(-0.495951, 117.135010),
              zoom: 16,
            ),
            onMapCreated: (GoogleMapController mapController) {
              controller.setMapController(mapController);
            },
          ),
          (false)
              ? Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, right: 1),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(7 / 2)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedPadding(
                        padding: EdgeInsets.only(bottom: 50),
                        duration: Duration(milliseconds: 200),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            FontAwesomeIcons.mapPin,
                            color: Theme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          AyoSlidingUpPanel(
            panelController: controller.suggestionPanel,
            maxHeight: Get.size.height - 56,
            draggable: false,
            backdropTapClosesPanel: false,
            panel: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Mau di kirim ke mana ?',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  AyoTextFormField(
                    controller: controller.searchField,
                    textInputAction: TextInputAction.done,
                    hintText: 'Ketik nama jalan',
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pilih dari peta',
                            style: TextStyle(
                              color: Get.theme.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Divider(height: 30),
                          Obx(() {
                            return Expanded(
                              child: MediaQuery.removePadding(
                                removeBottom: false,
                                removeLeft: false,
                                removeRight: false,
                                removeTop: true,
                                context: context,
                                child: ListView.builder(
                                  itemCount: (!controller
                                          .googlePlaceController.loading.value)
                                      ? controller
                                          .googlePlaceController.places.length
                                      : 10,
                                  itemBuilder: (context, index) {
                                    return (!controller.googlePlaceController
                                            .loading.value)
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .mapMarkerAlt,
                                                    size: 16,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .fetchNearestMitra(
                                                      controller
                                                          .googlePlaceController
                                                          .places[index]
                                                          .placeId,
                                                    );
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${controller.helper.placeName(controller.googlePlaceController.places[index].description)}',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[800],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        '${controller.googlePlaceController.places[index].description}',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                      ),
                                                      (controller
                                                                  .googlePlaceController
                                                                  .places
                                                                  .length !=
                                                              index + 1)
                                                          ? Divider(height: 30)
                                                          : SizedBox(
                                                              height: 30),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : _suggestionLoader();
                                  },
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _suggestionLoader() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AyoShimmer(
        height: 40,
        width: 40,
        radius: 20,
      ),
      SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: AyoShimmer(height: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: AyoShimmer(
                height: 10,
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: AyoShimmer(
                height: 10,
                width: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: AyoShimmer(
                height: 10,
                width: 150,
              ),
            ),
            Divider(height: 30),
          ],
        ),
      ),
    ],
  );
}
