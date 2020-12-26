import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AyoSlidingUpPanel extends StatelessWidget {
  final PanelController controller;
  final PanelState defaultPanelState;
  final double maxHeight;
  final double minHeight;
  final Widget panel;
  final Widget body;

  AyoSlidingUpPanel({
    @required this.controller,
    @required this.defaultPanelState,
    @required this.maxHeight,
    @required this.minHeight,
    @required this.panel,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: this.controller,
      defaultPanelState: this.defaultPanelState,
      maxHeight: this.maxHeight,
      minHeight: this.minHeight,
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
      panel: this.panel,
      body: this.body,
    );
  }
}
