import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/intro_banner_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/repo/remote/initial_data_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPageController extends GetxController {
  final _initialDataApi = InitialDataApi();

  final AuthController _authController = Get.find<AuthController>();
  final ShoppingCartController _shoppingCartController =
      Get.find<ShoppingCartController>();
  final IntroBannerController _introBannerController =
      Get.find<IntroBannerController>();

  var error = false.obs;

  Future _cacheAsset() async {
    Future.wait([
      precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/shop.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/register.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/empty_cart.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/sign.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/login.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/register_other.svg'),
        null,
      ),
    ]);
  }

  Future initAuth() async {
    error.value = false;

    _authController.requestGuestAccess().then((_) {
      _initialDataApi.fetchInitialData().then((initialData) async {
        if (initialData != null) {
          final prefs = await SharedPreferences.getInstance();

          //set shopping cart
          await _shoppingCartController
              .setShoppingCart(initialData.shoppingCartModel);

          //navigate to intro or app
          if ((prefs.getBool('intro') ?? false) == false) {
            await _introBannerController.setIntros(initialData.introImageModel);

            Get.offAllNamed('/intro', arguments: initialData.introImageModel);
          } else {
            Get.offAllNamed('/app');
          }
        } else {
          error.value = true;
        }
      });
    });
  }

  @override
  void onInit() async {
    await _cacheAsset();
    await initAuth();
    super.onInit();
  }
}
