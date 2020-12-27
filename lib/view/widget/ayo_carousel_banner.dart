import 'package:ayoo/model/carousel_banner_model.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AyoCarouselBanner extends StatelessWidget {
  final List<CarouselBannerModel> banners;
  final int active;
  final Function onPageChanged;

  AyoCarouselBanner({
    @required this.banners,
    @required this.active,
    @required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider.builder(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              onPageChanged(index);
            },
            viewportFraction: 1.0,
            height: double.infinity,
            autoPlay: true,
            enableInfiniteScroll: true,
          ),
          itemCount: banners.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return CachedNetworkImage(
              imageUrl: banners[itemIndex].url,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) {
                return AyoShimmer(radius: 0);
              },
            );
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: banners.map((url) {
                int index = banners.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active == index ? Colors.red : Colors.grey[100],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 20,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Text(
                'Semua Promo',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
