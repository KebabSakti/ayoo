import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPageOther extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // init: ProductDetailPageOtherController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Product Detail Page Other'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('GO TO ${controller.product.name}'),
                    onPressed: () {
                      Get.toNamed(
                        '/product_detail_other',
                        arguments: controller.product,
                        preventDuplicates: false,
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  itemCount: 100,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                  ),
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      // controller.text.value = 'This is index $index';
                    },
                    title: Text('This is index $index'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
