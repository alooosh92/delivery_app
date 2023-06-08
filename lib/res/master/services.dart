import 'package:delivery_app/res/controller/appbar_controller.dart';
import 'package:delivery_app/res/controller/navigationbar_controller.dart';
import 'package:delivery_app/res/controller/pageview_controller.dart';
import 'package:delivery_app/res/controller/shop_controller.dart';
import 'package:get/get.dart';

class Services implements Bindings {
  @override
  void dependencies() {
    Get.put(AppbarController(), permanent: true);
    Get.put(NavigationbarController(), permanent: true);
    Get.put(PageviewController(), permanent: true);
    Get.put(ShopController(), permanent: true);
  }
}
