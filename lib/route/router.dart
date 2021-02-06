import 'package:ayoo/binding/add_delivery_address_page_binding.dart';
import 'package:ayoo/binding/app_page_binding.dart';
import 'package:ayoo/binding/category_page_binding.dart';
import 'package:ayoo/binding/delivery_address_page_binding.dart';
import 'package:ayoo/binding/delivery_detail_page_binding.dart';
import 'package:ayoo/binding/intro_page_binding.dart';
import 'package:ayoo/binding/order_summary_page_binding.dart';
import 'package:ayoo/binding/payment_channel_page_binding.dart';
import 'package:ayoo/binding/product_category_page_binding.dart';
import 'package:ayoo/binding/product_page_binding.dart';
import 'package:ayoo/binding/product_review_page_binding.dart';
import 'package:ayoo/binding/search_page_binding.dart';
import 'package:ayoo/binding/shopping_cart_page_binding.dart';
import 'package:ayoo/view/page/add_delivery_address_page.dart';
import 'package:ayoo/view/page/category_page.dart';
import 'package:ayoo/view/page/delivery_address_page.dart';
import 'package:ayoo/view/page/delivery_detail_page.dart';
import 'package:ayoo/view/page/order_summary_page.dart';
import 'package:ayoo/view/page/page.dart';
import 'package:ayoo/binding/binding.dart';
import 'package:ayoo/view/page/payment_channel_page.dart';
import 'package:ayoo/view/page/product_category_page.dart';
import 'package:ayoo/view/page/product_detail_page.dart';
import 'package:ayoo/view/page/product_detail_page_other.dart';
import 'package:ayoo/view/page/product_review_page.dart';
import 'package:ayoo/view/page/shopping_cart_page.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: '/',
      page: () => InitialPage(),
      binding: InitialPageBinding(),
    ),
    GetPage(
      name: '/intro',
      page: () => IntroPage(),
      binding: IntroPageBinding(),
    ),
    GetPage(
      name: '/app',
      page: () => AppPage(),
      binding: AppPageBinding(),
    ),
    GetPage(
      name: '/search',
      page: () => SearchPage(),
      binding: SearchPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: '/product/:tag',
      page: () => ProductPage(),
      binding: ProductPageBinding(),
    ),
    GetPage(
      name: '/category',
      page: () => CategoryPage(),
      binding: CategoryPageBinding(),
    ),
    GetPage(
      name: '/product_category',
      page: () => ProductCategoryPage(),
      binding: ProductCategoryPageBinding(),
    ),
    GetPage(
      name: '/product_detail',
      page: () => ProductDetailPage(),
    ),
    GetPage(
      name: '/product_review',
      page: () => ProductReviewPage(),
      binding: ProductReviewPageBinding(),
    ),
    GetPage(
      name: '/cart_page',
      page: () => ShoppingCartPage(),
      binding: ShoppingCartPageBinding(),
    ),
    GetPage(
      name: '/order_summary',
      page: () => OrderSummaryPage(),
      binding: OrderSummaryPageBinding(),
    ),
    GetPage(
      name: '/product_detail_other',
      page: () => ProductDetailPageOther(),
    ),
    GetPage(
      name: '/delivery_address_page',
      page: () => DeliveryAddressPage(),
      binding: DeliveryAddressPageBinding(),
    ),
    GetPage(
      name: '/delivery_address_page/add',
      page: () => AddDeliveryAddressPage(),
      binding: AddDeliveryAddressPageBinding(),
    ),
    GetPage(
      name: '/delivery_detail_page',
      page: () => DeliveryDetailPage(),
      binding: DeliveryDetailPageBinding(),
    ),
    GetPage(
      name: '/payment_channel_page',
      page: () => PaymentChannelPage(),
      binding: PaymentChannelPageBinding(),
    ),
  ];
}
