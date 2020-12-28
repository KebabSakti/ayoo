import 'package:ayoo/controller/ayo_slidding_up_panel_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AyoSlidingUpPanel extends StatelessWidget {
  final Widget body;

  AyoSlidingUpPanel({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AyoSlidingUpPanelController(),
      builder: (controller) => SlidingUpPanel(
        controller: controller.panelController,
        defaultPanelState: PanelState.CLOSED,
        minHeight: 0,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16.0,
            spreadRadius: 0.2,
            offset: Offset(0.0, 1),
          ),
        ],
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.minus,
                color: Colors.grey[400],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.panel.value,
                ),
              ),
            )
          ],
        ),
        body: this.body,
      ),
    );
  }
}
