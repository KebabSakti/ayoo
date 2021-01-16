import 'package:ayoo/controller/product_review_page_controller.dart';
import 'package:ayoo/view/widget/ayo_scroll_to_top_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

class ProductReviewPage extends GetView<ProductReviewPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                title: Text(
                  'Ulasan Pembeli',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: Get.size.width / 3,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.grey[800],
                                ),
                                children: [
                                  TextSpan(
                                    text: controller.ratingWeight.rating,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' / 5',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _myRating(
                                double.parse(controller.ratingWeight.rating)),
                            SizedBox(height: 4),
                            Text(
                              '${controller.ratingWeight.totalVote} Ulasan',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _myRatingWithCount(
                                  rating: 5,
                                  count: controller.ratingWeight.five,
                                  maxCount: controller.ratingWeight.totalVote),
                              _myRatingWithCount(
                                  rating: 4,
                                  count: controller.ratingWeight.four,
                                  maxCount: controller.ratingWeight.totalVote),
                              _myRatingWithCount(
                                  rating: 3,
                                  count: controller.ratingWeight.three,
                                  maxCount: controller.ratingWeight.totalVote),
                              _myRatingWithCount(
                                  rating: 2,
                                  count: controller.ratingWeight.two,
                                  maxCount: controller.ratingWeight.totalVote),
                              _myRatingWithCount(
                                  rating: 1,
                                  count: controller.ratingWeight.one,
                                  maxCount: controller.ratingWeight.totalVote),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return SliverStickyHeader(
                  header: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: Get.size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: ChoiceChip(
                            label: Row(
                              children: [
                                Text(
                                  index == 0 ? 'Semua' : '$index',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                (index != 0)
                                    ? Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                            backgroundColor: Colors.grey[200],
                            selected: controller.filter.value == index,
                            selectedColor: Colors.green.withOpacity(0.5),
                            elevation: 0,
                            pressElevation: 0,
                            onSelected: (_) {
                              controller.setFilter(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  sliver: (controller.ratings.length > 0)
                      ? SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: (index.isEven)
                                    ? Colors.white
                                    : Colors.grey[50],
                                border: Border(
                                  bottom: BorderSide(
                                    width:
                                        (index + 1 < controller.ratings.length)
                                            ? 1
                                            : 0,
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _myRating(double.parse(
                                      controller.ratings[index].star)),
                                  SizedBox(height: 6),
                                  Text(
                                    controller
                                        .ratings[index].customerModel.name,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    controller.ratings[index].comment,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            );
                          }, childCount: controller.ratings.length),
                        )
                      : SliverToBoxAdapter(
                          child: Container(
                            height: Get.size.height / 2,
                            child: Center(
                              child: Text(
                                'Tidak ada hasil',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                );
              }),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: AyoScrollToTopButton(
              tag: 'ProductReview',
              scrollController: controller.scrollController,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _myRating(double rating) {
  return RatingBar(
    initialRating: rating,
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    ignoreGestures: true,
    itemSize: 12,
    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
    ratingWidget: RatingWidget(
      empty: Icon(
        Icons.star,
        color: Colors.grey[400],
      ),
      half: Icon(
        Icons.star_half,
        color: Colors.amber,
      ),
      full: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    ),
    onRatingUpdate: (_) {},
  );
}

Widget _myRatingWithCount(
    {@required double rating, @required int count, @required int maxCount}) {
  return Row(
    children: [
      _myRating(rating),
      SizedBox(width: 10),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: maxCount > 0 ? (count / maxCount) * 1.0 : 0,
            backgroundColor: Colors.grey[400],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        ),
      ),
      SizedBox(width: 10),
      SizedBox(
        width: 15,
        child: Text(
          count.toString(),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 10,
          ),
        ),
      ),
    ],
  );
}
