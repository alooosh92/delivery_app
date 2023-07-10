import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:delivery_app/res/screen/home/widget/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestorantScreen extends StatelessWidget {
  const RestorantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeControllar = Get.find();
    return ShopWidget(
      shopList: homeControllar.restorantList,
      text: Tr.restorantName.tr,
    );
  }
}
