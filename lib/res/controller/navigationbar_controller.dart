import 'package:delivery_app/res/controller/pageview_controller.dart';
import 'package:get/get.dart';

class NavigationbarController extends GetxController {
  int page = 0;
  void pageScroll(double pageNumber) {
    page = pageNumber.toInt();
    update();
  }

  void pageClick(double pageNumber) {
    page = pageNumber.toInt();
    PageviewController pag = Get.find();
    pag.pageIndex(page.toDouble());
    update();
  }
}
