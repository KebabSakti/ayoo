import 'package:ayoo/instance/helper_instance.dart';
import 'package:ayoo/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoProductItem extends StatelessWidget {
  final ProductModel product;

  AyoProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Get.toNamed('product_detail', arguments: product);
        },
        onDoubleTap: () {
          print('love it');
        },
        borderRadius: BorderRadius.circular(10),
        splashColor: Theme.of(context).accentColor.withOpacity(0.3),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[200]),
          ),
          child: Column(
            children: [
              Ink(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(product.cover),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.only(top: 6, right: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${Get.find<HelperInstance>().formatMoney(double.parse(product.unitModel.amount), name: '')} ${product.unitModel.unit}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6, right: 6),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 10,
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          size: 13,
                          color: (product.favourite != null)
                              ? Theme.of(context).primaryColor
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (double.parse(product.discount) > 0)
                      ? Row(
                          children: [
                            Text(
                              Get.find<HelperInstance>()
                                  .formatMoney(double.parse(product.price)),
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
              SizedBox(height: 5),
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
              Spacer(),
              Text(
                product.deliveryTypeModel.instant == 1
                    ? 'Pengiriman Langsung'
                    : 'Pengiriman Terjadwal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[600],
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
