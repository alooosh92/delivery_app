import 'package:delivery_app/res/screen/home/widget/image_card.dart';
import 'package:delivery_app/res/screen/home/widget/row_descoine.dart';
import 'package:delivery_app/res/screen/map/map.dart';
import 'package:delivery_app/res/screen/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../database/qote_Today.dart';
import '../../../master_widget/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(10),
                  shadowColor:
                      const MaterialStatePropertyAll(ColorManager.appbarcolor),
                  fixedSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width * 0.9, 40),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(ColorManager.textWhite)),
              onPressed: () {
                Get.to(MapScreen(text: 'تحديد مكان الاستلام', press: () {}));
              },
              icon: const Icon(Icons.add_box_outlined, color: Colors.black),
              label: const Text(
                ' إضافة طلب توصيل عن طريق الخريطة',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w900),
              ),
            ),
            FutureBuilder<List<QoteToday>>(
              future: QoteToday.getQoteToday(),
              initialData: const [],
              builder: (context, snapshot) {
                Map<String, List<Widget>> type = {};
                // ignore: unused_local_variable
                List<ImageCard> l = [];
                for (var element in snapshot.data!) {
                  type.addIf(!type.containsKey(element.shoptype),
                      element.shoptype, l = []);
                  type[element.shoptype]!.add(
                    ImageCard(
                        path: element.imageUrl,
                        press: () {
                          Get.to(ShopScreen(shop: element.shopId));
                        }),
                  );
                }
                List<Widget> out = [];
                type.forEach((key, value) {
                  out.add(RowDescoine(listWidget: value));
                });
                return Column(
                  children: out,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
