import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/screen/home/widget/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopsScreen extends StatelessWidget {
  const ShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return ShopWidget(
      shopList: homeController.shopList,
      text: 'اسم المحل',
    );
  }
}
