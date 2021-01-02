import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AyoSlidingUpProductFilter extends StatelessWidget {
  final panelController;
  final productController;
  final productFilterController;

  AyoSlidingUpProductFilter({
    @required this.panelController,
    @required this.productController,
    @required this.productFilterController,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
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
            child: AyoWrapPoductFilter(
              productController: productController,
            ),
          )
        ],
      ),
    );
  }
}
