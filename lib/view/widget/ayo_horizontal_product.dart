import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/view/widget/ayo_product_item.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoHorizontalProduct extends StatelessWidget {
  final List<ProductModel> products;
  final bool loading;

  const AyoHorizontalProduct({
    @required this.products,
    this.loading = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: (!loading) ? products.length : 4,
      itemBuilder: (context, index) {
        return Container(
          width: (Get.size.width - 20) / 2,
          padding: EdgeInsets.only(
            right: (!loading)
                ? (index >= 0 && index < products.length - 1)
                    ? 10
                    : 0
                : 10,
          ),
          child: (!loading)
              ? AyoProductItem(
                  product: products[index],
                )
              : AyoShimmer(),
        );
      },
    );
  }
}
