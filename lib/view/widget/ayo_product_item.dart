import 'dart:math';

import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:ayoo/view/widget/ayo_delivery_type_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AyoProductItem extends StatelessWidget {
  final ProductModel product;

  AyoProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
              '/product_detail/' + Random().nextInt(999999999).toString(),
              arguments: product,
              preventDuplicates: false);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: product.cover,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[50],
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (double.parse(product.discount) > 0)
                            ? Row(
                                children: [
                                  Text(
                                    Get.find<HelperInstance>().formatMoney(
                                        double.parse(product.price)),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[400],
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                ],
                              )
                            : SizedBox.shrink(),
                        Text(
                          Get.find<HelperInstance>()
                              .formatMoney(double.parse(product.lastPrice)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    RatingBar(
                      initialRating: product.ratingWeightModel != null
                          ? double.parse(product.ratingWeightModel.rating)
                          : 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: true,
                      itemSize: 12,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      ratingWidget: RatingWidget(
                          empty: Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                          half: Icon(
                            Icons.star_half,
                            color: Colors.amber,
                          ),
                          full: Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                      onRatingUpdate: (_) {},
                    ),
                    SizedBox(height: 6),
                    AyoDeliveryTypeContainer(type: product.deliveryTypeModel),
                    SizedBox(height: 6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
