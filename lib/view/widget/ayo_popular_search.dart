import 'package:ayoo/model/most_search_model.dart';
import 'package:ayoo/view/widget/ayo_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyoPopularSearch extends StatelessWidget {
  final List<MostSearchModel> populars;
  final bool loading;

  AyoPopularSearch({
    @required this.populars,
    this.loading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: (!loading)
                      ? Material(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            splashColor:
                                Theme.of(context).accentColor.withOpacity(0.3),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                              ),
                              child: Row(
                                children: [
                                  (populars[0].image != null)
                                      ? Flexible(
                                          flex: 2,
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                        populars[0].image),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  Flexible(
                                    flex: 3,
                                    child: Ink(
                                      height: double.infinity,
                                      padding: EdgeInsets.only(
                                        left: 4,
                                        right: 4,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${populars[0].keyword}',
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : AyoShimmer(),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: (!loading)
                      ? Material(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Get.theme.accentColor.withOpacity(0.3),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Ink(
                                      height: double.infinity,
                                      padding: EdgeInsets.only(
                                        left: 4,
                                        right: 4,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${populars[1].keyword}',
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  (populars[1].image != null)
                                      ? Flexible(
                                          flex: 2,
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                        populars[1].image),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        )
                      : AyoShimmer(),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: (!loading)
                      ? Material(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Get.theme.accentColor.withOpacity(0.3),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                              ),
                              child: Row(
                                children: [
                                  (populars[2].image != null)
                                      ? Flexible(
                                          flex: 2,
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                        populars[2].image),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  Flexible(
                                    flex: 3,
                                    child: Ink(
                                      height: double.infinity,
                                      padding: EdgeInsets.only(
                                        left: 4,
                                        right: 4,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${populars[2].keyword}',
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : AyoShimmer(),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: (!loading)
                      ? Material(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Get.theme.accentColor.withOpacity(0.3),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Ink(
                                      height: double.infinity,
                                      padding: EdgeInsets.only(
                                        left: 4,
                                        right: 4,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${populars[3].keyword}',
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  (populars[3].image != null)
                                      ? Flexible(
                                          flex: 2,
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                        populars[3].image),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        )
                      : AyoShimmer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
