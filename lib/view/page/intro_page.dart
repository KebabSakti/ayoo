import 'package:ayoo/controller/intro_page_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage extends GetView<IntroPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  controller.activeSlider.value = index;
                },
                viewportFraction: 1.0,
                height: 500,
                autoPlay: false,
                enableInfiniteScroll: false,
              ),
              carouselController: controller.carouselController,
              itemCount: Get.arguments.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: Get.arguments[index].url,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Text(
                            '${Get.arguments[index].title}',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '${Get.arguments[index].caption}',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () {
                    if (controller.activeSlider.value > 0) {
                      return FlatButton(
                        child: Text(
                          'Kembali',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        onPressed: () {
                          controller.carouselController.previousPage();
                        },
                      );
                    }

                    return SizedBox(width: 90);
                  },
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.from(Get.arguments.map((item) {
                      int index = Get.arguments.indexOf(item);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.activeSlider.value == index
                              ? Colors.red
                              : Colors.grey[400],
                        ),
                      );
                    })).toList(),
                  ),
                ),
                Obx(
                  () {
                    if ((controller.activeSlider.value + 1) ==
                        Get.arguments.length) {
                      return FlatButton(
                        child: Text(
                          'Mulai',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          Get.offAllNamed('/app');
                        },
                      );
                    }

                    return FlatButton(
                      child: Text('Berikut'),
                      onPressed: () {
                        controller.carouselController.nextPage();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
