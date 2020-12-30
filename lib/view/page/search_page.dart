import 'package:ayoo/controller/search_page_controller.dart';
import 'package:ayoo/view/widget/ayo_search_history_section.dart';
import 'package:ayoo/view/widget/ayo_search_last_seen_section.dart';
import 'package:ayoo/view/widget/ayo_search_popular_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => controller.init(),
        child: CustomScrollView(
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
                    suffixIcon: Icon(
                      FontAwesomeIcons.solidTimesCircle,
                      color: Colors.grey,
                    ),
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
                  onSubmitted: (value) {},
                ),
              ),
            ),
            AyoSearchLastSeenSection(controller: controller),
            AyoSearchHistorySection(controller: controller),
            AyoSearchPopularSection(controller: controller),
          ],
        ),
      ),
    );
  }
}
