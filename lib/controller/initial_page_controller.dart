import 'package:ayoo/controller/auth_controller.dart';
import 'package:ayoo/controller/intro_banner_controller.dart';
import 'package:ayoo/controller/shopping_cart_controller.dart';
import 'package:ayoo/repo/remote/initial_data_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPageController extends GetxController {
  final _initialDataApi = InitialDataApi();

  final _authController = Get.find<AuthController>();
  final _shoppingCartController = Get.find<ShoppingCartController>();
  final _introBannerController = Get.find<IntroBannerController>();

  var error = false.obs;

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

  void _authStateListener() async {
    error.value = false;

    ever(_authController.authModel, (auth) async {
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
  void onInit() {
    initAuth();
    super.onInit();
  }
}
