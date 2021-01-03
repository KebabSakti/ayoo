import 'package:ayoo/binding/app_page_binding.dart';
import 'package:ayoo/binding/category_page_binding.dart';
import 'package:ayoo/binding/intro_page_binding.dart';
import 'package:ayoo/binding/product_category_page_binding.dart';
import 'package:ayoo/binding/product_detail_page_binding.dart';
import 'package:ayoo/binding/product_page_binding.dart';
import 'package:ayoo/binding/search_page_binding.dart';
import 'package:ayoo/view/page/category_page.dart';
import 'package:ayoo/view/page/page.dart';
import 'package:ayoo/binding/binding.dart';
import 'package:ayoo/view/page/product_category_page.dart';
import 'package:ayoo/view/page/product_detail_page.dart';
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
      binding: AppPageBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/search',
      page: () => SearchPage(),
      binding: SearchPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/product',
      page: () => ProductPage(),
      binding: ProductPageBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/category',
      page: () => CategoryPage(),
      binding: CategoryPageBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/product_category',
      page: () => ProductCategoryPage(),
      binding: ProductCategoryPageBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: '/product_detail',
      page: () => ProductDetailPage(),
      binding: ProductDetailPageBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
  ];
}
