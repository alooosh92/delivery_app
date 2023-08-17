import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../database/shop.dart';
import '../../../master_widget/color.dart';
import '../../../master_widget/tr.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({super.key, required this.shop});
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return InkWell(
      onTap: () {
        homeController.clickShop(shop.id);
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
                            children: homeController
                                .shopDescriptionList(shop.shopDescription),
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
                        child: Text(
                          Tr.deliveryCost.tr,
                          style: const TextStyle(
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
                          homeController.getPriceBetweenToPoint(
                              LatLng(shop.lateLocation, shop.longLocation)),
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
