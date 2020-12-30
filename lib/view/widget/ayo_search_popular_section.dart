import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoSearchPopularSection extends StatelessWidget {
  final controller;

  AyoSearchPopularSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(
        () {
          if (!controller.searchPopular.loading.value &&
              controller.searchPopular.searchModel.length == 0) {
            return SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 6),
                child: Text(
                  'Pencarian Populer',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              MediaQuery.removePadding(
                removeTop: true,
                removeBottom: false,
                removeLeft: false,
                removeRight: false,
                context: context,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: (!controller.searchPopular.loading.value)
                      ? controller.searchPopular.searchModel.length
                      : 4,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: (!controller.searchPopular.loading.value)
                                ? CachedNetworkImage(
                                    imageUrl: controller
                                        .searchPopular.searchModel[index].image,
                                    placeholder: (context, url) =>
                                        AyoShimmer(radius: 6),
                                    fit: BoxFit.cover,
                                    height: 45,
                                    width: 60,
                                  )
                                : AyoShimmer(
                                    height: 45,
                                    width: 60,
                                    radius: 6,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            onTap: () {},
                            dense: true,
                            title: (!controller.searchPopular.loading.value)
                                ? Text(
                                    controller.searchPopular.searchModel[index]
                                        .keyword,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                    ),
                                  )
                                : SizedBox(
                                    width: 10,
                                    height: 15,
                                    child: AyoShimmer(radius: 6),
                                  ),
                            subtitle: (!controller.searchPopular.loading.value)
                                ? Text(
                                    '${controller.searchPopular.searchModel[index].hits} pencarian',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  )
                                : SizedBox(
                                    width: 10,
                                    height: 15,
                                    child: AyoShimmer(radius: 6),
                                  ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
