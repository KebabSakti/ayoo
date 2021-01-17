import 'package:ayoo/route/router.dart';
import 'package:ayoo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: AppRouter.routes,
    theme: AppTheme.primary,
    showPerformanceOverlay: true,
  ));
}
