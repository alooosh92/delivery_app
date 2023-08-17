import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/shop_controller.dart';
import '../../../database/shop_item.dart';

class ShopBody extends StatelessWidget {
  const ShopBody({super.key, required this.shop});
  final String shop;
  @override
  Widget build(BuildContext context) {
    ShopController shopController = Get.find();
    return FutureBuilder<ShopItem?>(
        initialData: null,
        future: ShopItem.getShop(shop),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children:
                      shopController.getShopinfo(context, snapshot.data!)),
            ),
          );
        });
  }
}
