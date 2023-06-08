import 'package:delivery_app/res/widget/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/shop_controller.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShopController controllar = Get.find();
    return ShopWidget(
      shopList: controllar.shop,
      text: 'اسم المحل',
    );
  }
}
