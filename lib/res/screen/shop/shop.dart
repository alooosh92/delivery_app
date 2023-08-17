import 'package:delivery_app/res/screen/shop/widget/shop_body.dart';
import 'package:flutter/material.dart';
import '../../master_widget/app_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key, required this.shop});
  final String shop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefult(),
      body: ShopBody(shop: shop),
    );
  }
}
