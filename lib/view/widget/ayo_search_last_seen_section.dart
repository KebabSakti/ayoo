import 'dart:math';

import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoSearchLastSeenSection extends StatelessWidget {
  final controller;

  AyoSearchLastSeenSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.lastSeenProduct.loading.value &&
            controller.lastSeenProduct.productPaginateModel.value.data.length ==
                0) {
          return SizedBox.shrink();
        }

        return Container(
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Terakhir Dilihat',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: (!controller.lastSeenProduct.loading.value)
                        ? controller.lastSeenProduct.productPaginateModel.value
                            .data.length
                        : 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Ink(
                          width: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: (!controller.lastSeenProduct.loading.value)
                                ? InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          '/product_detail/' +
                                              Random()
                                                  .nextInt(999999999)
                                                  .toString(),
                                          arguments: controller
                                              .lastSeenProduct
                                              .productPaginateModel
                                              .value
                                              .data[index],
                                          preventDuplicates: false);
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl: controller
                                          .lastSeenProduct
                                          .productPaginateModel
                                          .value
                                          .data[index]
                                          .cover,
                                      placeholder: (context, url) =>
                                          AyoShimmer(radius: 6),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : AyoShimmer(radius: 6),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
