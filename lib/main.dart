import 'package:ayoo/route/router.dart';
import 'package:ayoo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      initialRoute: '/',
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      getPages: AppRouter.routes,
      theme: AppTheme.primary,
      showPerformanceOverlay: false,
    );
  }
}
