import 'package:ayoo/controller/search_page_controller.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:ayoo/view/widget/ayo_search_history_section.dart';
import 'package:ayoo/view/widget/ayo_search_last_seen_section.dart';
import 'package:ayoo/view/widget/ayo_search_popular_section.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                titleSpacing: 0,
                pinned: true,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.grey[800], //change your color here
                ),
                title: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextField(
                    controller: controller.searchField,
                    autofocus: false,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    cursorColor: Colors.grey[800],
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      hintText: 'Cari di sini',
                      isDense: true, // Added this
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      suffixIcon: Obx(() => (controller.searchMode.value)
                          ? IconButton(
                              onPressed: () => controller.clearSearchKeyword(),
                              constraints: BoxConstraints(),
                              iconSize: 20,
                              icon: Icon(
                                FontAwesomeIcons.solidTimesCircle,
                                color: Colors.grey,
                              ),
                            )
                          : SizedBox.shrink()),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.grey,
                        size: 16,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 32,
                        minWidth: 40,
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minHeight: 32,
                        minWidth: 40,
                      ),
                    ),
                    onSubmitted: (value) {
                      controller.navigateToProduct(keyword: value);
                    },
                  ),
                ),
              ),
              Obx(() {
                if (controller.searchMode.value) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ListTile(
                          onTap: () {
                            controller.navigateToProduct(
                                keyword: controller.searchController
                                    .searchModel[index].keyword);
                          },
                          dense: true,
                          leading: (!controller.searchController.loading.value)
                              ? Icon(
                                  Icons.search,
                                  size: 20,
                                )
                              : SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: AyoShimmer(radius: 10),
                                ),
                          trailing: (!controller.searchController.loading.value)
                              ? Icon(
                                  FontAwesomeIcons.externalLinkAlt,
                                  size: 14,
                                )
                              : SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: AyoShimmer(radius: 10),
                                ),
                          title: Transform.translate(
                            offset: Offset(-20, 0),
                            child: (!controller.searchController.loading.value)
                                ? Text(
                                    controller.searchController
                                        .searchModel[index].keyword,
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
                          ),
                        );
                      },
                      childCount: (!controller.searchController.loading.value)
                          ? controller.searchController.searchModel.length
                          : 10,
                    ),
                  );
                }

                return SliverList(
                  delegate: SliverChildListDelegate([
                    AyoSearchLastSeenSection(controller: controller),
                    AyoSearchHistorySection(controller: controller),
                    AyoSearchPopularSection(controller: controller),
                  ]),
                );
              }),
            ],
          ),
          AyoScrollToTopButton(
            scrollController: controller.scrollController,
            tag: 'SearchPage',
          ),
        ],
      ),
    );
  }
}
