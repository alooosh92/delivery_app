import 'package:delivery_app/res/master/api.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  double width = 100.0;
  List<Shop> shop = [];
  List<Shop> restorant = [];
  void widthSize(double screen, double x, double y, double i) {
    width = screen - x - y - i - 10;
  }

  @override
  void onInit() {
    getShopRegion();
    super.onInit();
  }

  void getShopRegion() async {
    var l = await Shop.getShopRegion();
    if (l.isNotEmpty) {
      for (var element in l) {
        if (element.isFood) {
          restorant.add(element);
        } else {
          shop.add(element);
        }
      }
    }
  }
}
