import 'package:ayoo/controller/find_courier_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FindCourierPage extends GetView<FindCourierPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/courier.json'),
            SizedBox(
              width: 300,
              child: Text(
                'Mencari kurir, mohon tunggu..',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
