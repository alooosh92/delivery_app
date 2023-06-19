import 'package:delivery_app/res/controller/shop_controller.dart';
import 'package:delivery_app/res/screen/home/widget/shop_card.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormFieldSearch(
            text: text,
            onchanged: (val) {},
          ),
          GetBuilder<ShopController>(
            builder: (controller) {
              List<Widget> list = [];
              for (var element in shopList) {
                var sh = ShopCard(
                  shop: element,
                );
                list.add(sh);
              }
              return Column(
                children: list,
              );
            },
          )
        ],
      ),
    );
  }
}
