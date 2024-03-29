import 'package:ayoo/controller/product_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoWrapPoductFilter extends StatelessWidget {
  final productController;
  final tag;

  AyoWrapPoductFilter({
    @required this.productController,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductFilterController(productController: productController),
      tag: tag,
      builder: (controller) {
        return Obx(
          () {
            var sortings = controller.filter.where((i) {
              return i.tag == 'sorting';
            }).toList();
            var filters = controller.filter.where((i) {
              return i.tag == 'filter';
            }).toList();
            var types = controller.filter.where((i) {
              return i.tag == 'pengiriman';
            }).toList();
            return Container(
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
                    children: List<Widget>.from(sortings
                        .map(
                          (item) => ChoiceChip(
                            label: Text(
                              '${item.title}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            backgroundColor: Colors.grey[200],
                            selected: item.selected,
                            selectedColor: Colors.green.withOpacity(0.5),
                            onSelected: (value) {
                              controller.setFilter(item, value);
                            },
                          ),
                        )
                        .toList()),
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
                    children: List<Widget>.from(filters
                        .map(
                          (item) => (item.key != 'rating')
                              ? ChoiceChip(
                                  label: Text(
                                    '${item.title}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  backgroundColor: Colors.grey[200],
                                  selected: item.selected,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  onSelected: (value) {
                                    controller.setFilter(item, value);
                                  },
                                )
                              : ChoiceChip(
                                  label: Text(
                                    '${item.title}',
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
                                  selected: item.selected,
                                  selectedColor: Colors.green.withOpacity(0.5),
                                  onSelected: (value) {
                                    controller.setFilter(item, value);
                                  },
                                ),
                        )
                        .toList()),
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
                    children: List<Widget>.from(types
                        .map(
                          (item) => ChoiceChip(
                            label: Text(
                              '${item.title}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            backgroundColor: Colors.grey[200],
                            selected: item.selected,
                            selectedColor: Colors.green.withOpacity(0.5),
                            onSelected: (value) {
                              controller.setFilter(item, value);
                            },
                          ),
                        )
                        .toList()),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
