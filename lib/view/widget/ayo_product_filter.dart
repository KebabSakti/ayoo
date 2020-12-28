import 'package:ayoo/controller/ayo_slidding_up_panel_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoProductFilter extends GetView<ProductPaginateController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Ink(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200],
            ),
          ),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Get.find<AyoSlidingUpPanelController>()
                        .setPanel(
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Urutkan',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 7,
                              runSpacing: -10,
                              children: [
                                ChoiceChip(
                                  label: Text(
                                    'Harga Terendah',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: false,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  onSelected: (value) {},
                                ),
                                ChoiceChip(
                                  label: Text(
                                    'Harga Tertinggi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: false,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  onSelected: (value) {},
                                ),
                                ChoiceChip(
                                  label: Text(
                                    'Terbaru',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  selected: true,
                                  onSelected: (value) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 7,
                              runSpacing: -10,
                              children: [
                                FilterChip(
                                  label: Text(
                                    'Paling Laku',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: true,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  checkmarkColor: Colors.green,
                                  onSelected: (value) {},
                                ),
                                FilterChip(
                                  label: Text(
                                    'Lagi Diskon',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: true,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  checkmarkColor: Colors.green,
                                  onSelected: (value) {},
                                ),
                                FilterChip(
                                  label: Text(
                                    'Paling di Cari',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: false,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  checkmarkColor: Colors.green,
                                  onSelected: (value) {},
                                ),
                                FilterChip(
                                  label: Text(
                                    'Trending',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: false,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  checkmarkColor: Colors.green,
                                  onSelected: (value) {},
                                ),
                                FilterChip(
                                  label: Text(
                                    '4 ke atas',
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
                                  selected: false,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  checkmarkColor: Colors.green,
                                  onSelected: (value) {},
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Jenis Pengiriman',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 7,
                              runSpacing: -10,
                              children: [
                                ChoiceChip(
                                  label: Text(
                                    'Instant',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: false,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  onSelected: (value) {},
                                ),
                                ChoiceChip(
                                  label: Text(
                                    'Terjadwal',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  selected: false,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  onSelected: (value) {},
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                        .then((_) {
                      Get.find<AyoSlidingUpPanelController>()
                          .setPanelPosition(0.7);
                    });
                  },
                  child: Ink(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.filter_list,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(width: 1, color: Colors.grey[100]),
            Flexible(
              flex: 1,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Get.find<AyoSlidingUpPanelController>()
                        .setPanel(Container(child: Text('Not oke')))
                        .then((_) {
                      Get.find<AyoSlidingUpPanelController>()
                          .setPanelPosition(0.5);
                    });
                  },
                  splashColor: Theme.of(context).accentColor.withOpacity(0.3),
                  child: Ink(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            FontAwesomeIcons.sort,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                          Text(
                            'Sorting',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
