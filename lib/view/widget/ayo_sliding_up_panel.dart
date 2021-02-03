import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AyoSlidingUpPanel extends StatelessWidget {
  final PanelController panelController;
  final Widget panel;
  final double minHeight;
  final double maxHeight;
  final bool draggable;
  final bool backdropTapClosesPanel;
  final PanelState panelState;

  AyoSlidingUpPanel({
    @required this.panelController,
    @required this.panel,
    this.panelState = PanelState.CLOSED,
    this.minHeight = 0,
    this.maxHeight = 500,
    this.draggable = true,
    this.backdropTapClosesPanel = true,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      isDraggable: draggable,
      defaultPanelState: panelState,
      minHeight: minHeight,
      maxHeight: maxHeight,
      backdropEnabled: true,
      backdropTapClosesPanel: backdropTapClosesPanel,
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
            child: panel,
          )
        ],
      ),
    );
  }
}
