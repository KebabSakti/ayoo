import 'package:ayoo/controller/category_page_controller.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Semua Kategori'),
      ),
      body: Obx(() {
        final _gridItemRatio = (Get.size.width / 3) /
            ((Get.size.height - kToolbarHeight - 190) / 3);
        return Row(
          children: [
            Ink(
              height: double.infinity,
              width: Get.size.width * 0.25,
              color: Colors.grey[100],
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: (controller.category.mainCategories.length > 0)
                    ? controller.category.mainCategories.length
                    : 10,
                itemBuilder: (context, index) => ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 80),
                  child: Ink(
                    color: (controller.active.value == index)
                        ? Colors.white
                        : Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        controller.setActive(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.network(
                              controller.category.mainCategories[index].image,
                              width: 40,
                              height: 40,
                              placeholderBuilder: (context) => AyoShimmer(
                                width: 40,
                                height: 40,
                                radius: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.category.mainCategories[index].title,
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
            ),
            Expanded(
              child: GridView.builder(
                itemCount: controller
                    .category
                    .mainCategories[controller.active.value]
                    .subCategoryModel
                    .length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) => Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.network(
                            controller
                                .category
                                .mainCategories[controller.active.value]
                                .subCategoryModel[index]
                                .image,
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
                            controller
                                .category
                                .mainCategories[controller.active.value]
                                .subCategoryModel[index]
                                .title,
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
            )
          ],
        );
      }),
    );
  }
}
