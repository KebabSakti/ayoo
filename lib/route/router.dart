import 'package:ayoo/binding/intro_page_binding.dart';
import 'package:ayoo/view/page/page.dart';
import 'package:ayoo/binding/binding.dart';
import 'package:get/get.dart';

class AppRouter {
  static final _transition = Transition.rightToLeft;
  static final _transitionDuration = Duration(milliseconds: 200);

  static final routes = [
    GetPage(
      name: '/',
      page: () => InitialPage(),
      binding: InitialPageBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/intro',
      page: () => IntroPage(),
      binding: IntroPageBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/app',
      page: () => AppPage(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/product_page',
      page: () => ProductPage(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
  ];
}
