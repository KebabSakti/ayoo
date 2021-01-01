import 'package:ayoo/model/main_category_model.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AyoMainCategory extends StatelessWidget {
  final List<MainCategoryModel> categories;
  final bool loading;

  const AyoMainCategory({
    @required this.categories,
    this.loading = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: (!loading) ? categories.length : 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Material(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                Get.toNamed('/product_category', arguments: categories[index]);
              },
              borderRadius: BorderRadius.circular(20),
              splashColor: Get.theme.accentColor.withOpacity(0.3),
              child: Ink(
                width: (Get.size.width - 30) / 2,
                child: (!loading)
                    ? Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.network(
                              categories[index].image,
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              categories[index].title.toString(),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : AyoShimmer(radius: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
