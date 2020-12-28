import 'package:ayoo/controller/ayo_slidding_up_panel_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/view/widget/ayo_wrap_product_filter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoHorizontalProductFilter extends StatelessWidget {
  final ProductPaginateController controller;

  AyoHorizontalProductFilter({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ButtonTheme(
              buttonColor: Colors.grey[350],
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ), //addsimits the touch area to the button area
              minWidth: 0, //wraps child's width
              height: 0, //wraps child's height
              child: RaisedButton(
                onPressed: () {
                  Get.find<AyoSlidingUpPanelController>()
                      .setPanel(
                    Container(
                      child: AyoWrapPoductFilter(),
                    ),
                  )
                      .then((_) {
                    Get.find<AyoSlidingUpPanelController>()
                        .setPanelPosition(0.7);
                  });
                },
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FaIcon(
                  FontAwesomeIcons.slidersH,
                  color: Colors.black.withOpacity(0.6),
                  size: 16,
                ),
              ), //your original button
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: FilterChip(
                      label: Text(
                        'Index $index',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      selected: (index == 1) ? true : false,
                      selectedColor: Colors.green.withOpacity(0.5),
                      checkmarkColor: Colors.green,
                      onSelected: (_) {
                        print(_);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
