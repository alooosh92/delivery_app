import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/screen/home/page/qote.dart';
import 'package:delivery_app/res/screen/home/page/restorant.dart';
import 'package:delivery_app/res/screen/home/page/search.dart';
import 'package:delivery_app/res/screen/home/widget/shops.dart';
import 'package:delivery_app/res/screen/home/page/user_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccontBody extends StatelessWidget {
  const AccontBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return PageView.builder(
      controller: homeController.pageController,
      onPageChanged: (value) {
        homeController.onScroll(value);
      },
      itemCount: screen.length,
      itemBuilder: (context, index) {
        return screen[index];
      },
    );
  }
}

List screen = [
  const HomeScreen(),
  const SearchScreen(),
  const RestorantScreen(),
  const ShopsScreen(),
  const UserOrderScreen(),
];
