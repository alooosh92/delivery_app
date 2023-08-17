import 'package:delivery_app/res/controller/map_controller.dart';
import 'package:delivery_app/res/controller/user_location_controller.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/home_controller.dart';
import '../controller/shop_controller.dart';
import '../controller/user_info_controller.dart';

class Services implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(MapController(), permanent: true);
    Get.put(ShopController(), permanent: true);
    Get.put(UserInfoController(), permanent: true);
    Get.put(UserLocationController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
