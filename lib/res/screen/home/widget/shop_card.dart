import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../controller/appbar_controller.dart';
import '../../../database/shop.dart';
import '../../../master_widget/color.dart';
import '../../shop/shop.dart';
import 'info_card.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({super.key, required this.shop});
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    List<Widget> lw = [];
    for (var element in shop.shopDescription) {
      lw.add(InfoCard(
        text: element,
        heigh: 25,
        margin: 5,
        textSize: 10,
      ));
    }
    AppbarController appController = Get.find();
    double p = Geolocator.distanceBetween(
      appController.late,
      appController.long,
      shop.lateLocation,
      shop.longLocation,
    );
    var price = ((p / 1000).ceil()) * 1500;
    return InkWell(
      onTap: () {
        Get.to(ShopScreen(shop: shop.id));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 150,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: const BoxDecoration(
          color: ColorManager.textWhite,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: ColorManager.appbarcolor,
              offset: Offset.zero,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(shop.urlImage), fit: BoxFit.fill),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.network(shop.urlLogo),
                      ),
                      Container(
                        height: 25,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.appbarcolor,
                        ),
                        child: Center(
                          child: Text(
                            shop.type,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                color: ColorManager.textWhite),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 279,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: lw,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        padding: const EdgeInsets.only(bottom: 5),
                        child: const Text(
                          'تكلفة التوصيل الى الموقع المحدد',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 1, top: 1, left: 8, right: 8),
                        decoration: BoxDecoration(
                            color: ColorManager.appbarcolor,
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          price > 100000 ? "حدد العنوان" : price.toString(),
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: ColorManager.textWhite),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
