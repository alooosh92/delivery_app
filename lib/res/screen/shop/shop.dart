import 'package:delivery_app/res/screen/shop/widget/shop_body.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../database/shop_item.dart';
import '../../master_widget/app_bar.dart';
import '../../master_widget/color.dart';
import '../home/widget/search.dart';

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
