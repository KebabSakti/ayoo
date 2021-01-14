import 'package:ayoo/controller/ayo_vertical_product_controller.dart';
import 'package:ayoo/controller/home_page_controller.dart';
import 'package:ayoo/controller/product_paginate_controller.dart';
import 'package:ayoo/view/widget/ayo_product_item.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoVerticalProduct extends StatelessWidget {
  final ProductPaginateController controller;
  final ScrollController scrollController;
  final String tag;

  AyoVerticalProduct({
    @required this.controller,
    @required this.scrollController,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AyoVerticalProductController(
        scrollController: scrollController,
        productPaginateController: this.controller,
      ),
      tag: tag,
      builder: (controller) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: Obx(
          () {
            final loading = (Get.find<HomePageController>().loading.value ||
                this.controller.loading.value);

            if (!loading &&
                this.controller.productPaginateModel.value.total == 0) {
              return SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    'Produk tidak ditemukan',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              );
            }

            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: ((Get.size.width - 30) / 2) / 210,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => (!loading &&
                        (index + 1) <=
                            this
                                .controller
                                .productPaginateModel
                                .value
                                .data
                                .length)
                    ? AyoProductItem(
                        product: this
                            .controller
                            .productPaginateModel
                            .value
                            .data[index],
                      )
                    : AyoShimmer(),
                childCount: (!loading)
                    ? (this.controller.moreLoading.value)
                        ? this
                                .controller
                                .productPaginateModel
                                .value
                                .data
                                .length +
                            2
                        : this.controller.productPaginateModel.value.data.length
                    : 6,
              ),
            );
          },
        ),
      ),
    );
  }
}
