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

  AyoVerticalProduct({
    @required this.controller,
    @required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AyoVerticalProductController(
        scrollController: scrollController,
        productPaginateController: this.controller,
      ),
      builder: (controller) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: Obx(
          () {
            final loading = (Get.find<HomePageController>().loading.value ||
                this.controller.loading.value);

            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: ((Get.size.width - 30) / 2) / 200,
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
                    : 4,
              ),
            );

            // return GridView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     childAspectRatio: ((Get.size.width - 30) / 2) / 200,
            //     mainAxisSpacing: 10,
            //     crossAxisSpacing: 10,
            //   ),
            //   itemCount: (!loading)
            //       ? this.controller.productPaginateModel.value.data.length
            //       : 4,
            //   itemBuilder: (context, index) => (!loading &&
            //           (index + 1) <=
            //               this
            //                   .controller
            //                   .productPaginateModel
            //                   .value
            //                   .data
            //                   .length)
            //       ? AyoProductItem(
            //           product: this
            //               .controller
            //               .productPaginateModel
            //               .value
            //               .data[index],
            //         )
            //       : AyoShimmer(),
            // );
          },
        ),
      ),
    );
  }
}
