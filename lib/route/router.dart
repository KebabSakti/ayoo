import 'package:ayoo/binding/intro_page_binding.dart';
import 'package:ayoo/view/page/page.dart';
import 'package:ayoo/binding/binding.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    GetPage(
        name: '/', page: () => InitialPage(), binding: InitialPageBinding()),
    GetPage(
        name: '/intro', page: () => IntroPage(), binding: IntroPageBinding()),
    GetPage(name: '/app', page: () => AppPage()),
    GetPage(name: '/product_page', page: () => ProductPage()),
  ];
}
