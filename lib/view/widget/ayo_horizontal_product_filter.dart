import 'package:ayoo/controller/product_filter_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AyoHorizontalProductFilter extends StatelessWidget {
  final ProductPaginateController controller;
  final PanelController panelController;
  final ProductFilterController productFilterController;

  AyoHorizontalProductFilter({
    @required this.controller,
    @required this.panelController,
    @required this.productFilterController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ButtonTheme(
              buttonColor: Colors.grey[200],
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ), //addsimits the touch area to the button area
              minWidth: 0, //wraps child's width
              height: 0, //wraps child's height
              child: RaisedButton(
                onPressed: () {
                  panelController.panelPosition = 0.7;
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
              child: Obx(
                () {
                  var filters = productFilterController.filter.where((i) {
                    return i.tag == 'filter';
                  }).toList();
                  return ListView.builder(
                    controller: controller.scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: (filters[index].key != 'rating')
                            ? FilterChip(
                                label: Text(
                                  '${filters[index].title}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                backgroundColor: Colors.grey[200],
                                selected: filters[index].selected,
                                selectedColor: Colors.green.withOpacity(0.5),
                                checkmarkColor: Colors.green,
                                onSelected: (value) {
                                  productFilterController.setFilter(
                                      filters[index], value);
                                },
                              )
                            : FilterChip(
                                label: Text(
                                  '${filters[index].title}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                avatar: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                backgroundColor: Colors.grey[200],
                                selected: filters[index].selected,
                                selectedColor: Colors.green.withOpacity(0.5),
                                checkmarkColor: Colors.green,
                                onSelected: (value) {
                                  productFilterController.setFilter(
                                      filters[index], value);
                                },
                              ),
                      );
                    },
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
