import 'package:delivery_app/res/master/api.dart';
import 'package:delivery_app/res/screen/map.dart';
import 'package:delivery_app/res/screen/shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../master/color.dart';

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

class RowDescoine extends StatelessWidget {
  const RowDescoine({super.key, required this.listWidget});
  final List<Widget> listWidget;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listWidget,
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.path,
    required this.press,
  });
  final String path;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: press,
        child: Image.network(
          path,
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.6,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
