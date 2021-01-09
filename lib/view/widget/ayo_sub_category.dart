import 'dart:math';

import 'package:ayoo/model/main_category_model.dart';
import 'package:ayoo/model/product_query_model.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AyoSubCategory extends StatelessWidget {
  final List<MainCategoryModel> categories;

  AyoSubCategory({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            color: Colors.grey[100],
            child: InkWell(
              onTap: () {
                Get.toNamed(
                    '/product/' + Random().nextInt(999999999).toString(),
                    arguments: ProductQueryModel(
                        subCategoryId: categories[index].subCategoryId));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      categories[index].image,
                      width: 40,
                      height: 40,
                      placeholderBuilder: (context) => AyoShimmer(
                        width: 40,
                        height: 40,
                        radius: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      categories[index].title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
