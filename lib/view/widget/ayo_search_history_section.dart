import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoSearchHistorySection extends StatelessWidget {
  final controller;

  AyoSearchHistorySection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.searchHistory.loading.value &&
            controller.searchHistory.searchModel.length == 0) {
          return SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Riwayat Pencarian',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.clearSearchHistory();
                    },
                    child: Text(
                      'Hapus',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
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
                itemCount: (!controller.searchHistory.loading.value)
                    ? controller.searchHistory.searchModel.length
                    : 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller.navigateToProduct(
                          keyword: controller
                              .searchHistory.searchModel[index].keyword);
                    },
                    dense: true,
                    trailing: (!controller.searchHistory.loading.value)
                        ? Icon(
                            Icons.history,
                            size: 20,
                          )
                        : SizedBox(
                            width: 20,
                            height: 20,
                            child: AyoShimmer(radius: 10),
                          ),
                    title: (!controller.searchHistory.loading.value)
                        ? Text(
                            controller.searchHistory.searchModel[index].keyword,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                              fontSize: 14,
                            ),
                          )
                        : SizedBox(
                            width: 50,
                            height: 20,
                            child: AyoShimmer(radius: 6),
                          ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
