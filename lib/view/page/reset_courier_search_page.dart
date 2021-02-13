import 'package:ayoo/controller/reset_courier_search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ResetCourierSearchPage extends GetView<ResetCourierSearchPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetCourierSearchPageController>(
      init: ResetCourierSearchPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.grey[800], //change your color here
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/courier_busy.svg',
                    width: 300,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Yah, semua kurir kami lagi sibuk\n Sentuh tombol di bawah untuk mencari ulang kurir',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  FlatButton(
                    onPressed: () {
                      controller.resetRequestQueue();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Get.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FontAwesomeIcons.search,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Cari ulang kurir',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
