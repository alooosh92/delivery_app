import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/item/item.dart';
import 'color.dart';
import 'elev_widget.dart';

class CardSearch extends StatelessWidget {
  const CardSearch(
      {super.key,
      required this.id,
      required this.elev,
      required this.image,
      required this.itemName,
      required this.price,
      required this.shopName});
  final String id;
  final String image;
  final String itemName;
  final String shopName;
  final double price;
  final double elev;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ItemScreen(id: id));
      },
      child: Column(
        children: [
          Stack(children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 175,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorManager.appbarcolor,
                boxShadow: [
                  BoxShadow(
                      color: ColorManager.appbarcolor,
                      offset: Offset.zero,
                      blurRadius: 10),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    image,
                    height: 125,
                    width: 125,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorManager.textWhite,
                    ),
                    width: 150,
                    height: 25,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(itemName),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    width: 150,
                    height: 25,
                    child: Center(child: Text(shopName)),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 15,
              bottom: 62,
              child: ElevWidget(
                elev: elev,
                size: 15,
              ),
            ),
            Positioned(
              bottom: 55,
              left: 0,
              child: Container(
                width: 80,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assest/images/price2.png")),
                ),
                child: Center(
                    child: Text(
                  price.toInt().toString(),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
