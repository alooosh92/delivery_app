import 'package:delivery_app/res/master_widget/app_bar.dart';
import 'package:delivery_app/res/screen/item/widget/item_body.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefult(),
      body: ItemBody(id: id),
    );
  }
}
