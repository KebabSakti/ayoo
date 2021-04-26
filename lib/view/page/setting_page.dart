import 'package:ayoo/controller/setting_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.grey[800], //change your color here
              ),
              title: Text(
                'Setting',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Notifikasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeLeft: true,
                    removeBottom: true,
                    removeTop: true,
                    removeRight: true,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          onTap: () {
                            controller.settingController.setPromo(
                                !controller.settingController.promo.value);
                          },
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          title: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidBell,
                                size: 20,
                                color: Colors.grey[800],
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Promo',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 50.0,
                            height: 25.0,
                            child: FlutterSwitch(
                              width: 50.0,
                              height: 25.0,
                              valueFontSize: 25.0,
                              toggleSize: 20.0,
                              value: controller.settingController.promo.value,
                              borderRadius: 30.0,
                              showOnOff: false,
                              activeColor: Colors.green,
                              onToggle: (value) {
                                controller.settingController.setPromo(value);
                              },
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey[400],
                        ),
                        ListTile(
                          onTap: () {
                            controller.settingController.setAds(
                                !controller.settingController.ads.value);
                          },
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          title: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidBell,
                                size: 20,
                                color: Colors.grey[800],
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Penawaran',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 50.0,
                            height: 25.0,
                            child: FlutterSwitch(
                              width: 50.0,
                              height: 25.0,
                              valueFontSize: 25.0,
                              toggleSize: 20.0,
                              value: controller.settingController.ads.value,
                              borderRadius: 30.0,
                              showOnOff: false,
                              activeColor: Colors.green,
                              onToggle: (value) {
                                controller.settingController.setAds(value);
                              },
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
