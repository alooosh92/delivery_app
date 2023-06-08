import 'package:delivery_app/res/controller/navigationbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageviewController extends GetxController {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  void pageIndex(double index) {
    pageController.animateToPage(index.toInt(),
        duration: const Duration(milliseconds: 2000), curve: Curves.easeInOut);
  }

  void onScroll(int page) {
    NavigationbarController nav = Get.find();
    nav.pageScroll(page.toDouble());
  }
}
