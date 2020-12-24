import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayoo/view/page/page.dart';
import 'package:ayoo/binding/binding.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    initialBinding: GlobalBinding(),
    getPages: [
      GetPage(name: '/', page: () => InitialPage(), binding: InitialBinding()),
      GetPage(
          name: '/intro', page: () => IntroPage(), binding: InitialBinding()),
      GetPage(name: '/app', page: () => AppPage(), binding: InitialBinding()),
    ],
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFFe63946),
      accentColor: Color(0xFF003049),
      colorScheme: ColorScheme.light().copyWith(
        primary: Color(0xFFD62828),
        primaryVariant: Color(0xFF264653),
        secondary: Color(0xFF2A9D8F),
        secondaryVariant: Color(0xFFE9C46A),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: IconThemeData(color: Colors.white),
      fontFamily: 'Montserrat',
    ),
  ));
}
