import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AyoSlidingUpPanelController extends GetxController {
  final PanelController panelController = PanelController();
  var panel = Container().obs;

  Future setPanel(Widget widget) async {
    panel.value = widget;
  }

  void setPanelPosition(double pos) {
    panelController.panelPosition = pos;
  }
}
