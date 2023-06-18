import 'package:delivery_app/res/screen/home/widget/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/shop_controller.dart';

class RestorantScreen extends StatelessWidget {
  const RestorantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShopController controllar = Get.find();
    return ShopWidget(
      shopList: controllar.restorant,
      text: 'اسم المطعم',
    );
  }
}
