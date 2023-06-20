import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../database/shop.dart';
import 'text_form_field_search.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({
    super.key,
    required this.text,
    required this.shopList,
  });
  final String text;
  final List<Shop> shopList;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormFieldSearch(
            text: text,
            onchanged: (val) {},
          ),
          GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
                children: homeController.getListShop(shopList),
              );
            },
          )
        ],
      ),
    );
  }
}
