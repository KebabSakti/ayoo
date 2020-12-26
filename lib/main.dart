import 'package:ayoo/route/router.dart';
import 'package:ayoo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayoo/binding/binding.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    initialBinding: GlobalBinding(),
    getPages: AppRouter.routes,
    theme: AppTheme.primary,
  ));
}
