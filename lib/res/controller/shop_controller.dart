import 'package:get/get.dart';
import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../database/shop_item.dart';
import '../master_widget/card_search.dart';
import '../master_widget/color.dart';
import '../master_widget/elev_widget.dart';

class ShopController extends GetxController {
  List<Widget> getShopinfo(BuildContext context, ShopItem shopItem) {
    HomeController homeController = Get.find();
    List<Widget> list = [
      Image.network(
        shopItem.shop!.urlImage,
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 40,
                child: Image.network(shopItem.shop!.urlLogo),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.appbarcolor,
                ),
                child: Center(
                  child: Text(
                    shopItem.shop!.type,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.textWhite),
                  ),
                ),
              ),
            ],
          ),
          ElevWidget(
            elev: shopItem.shop!.evaluation,
            size: 25,
          )
        ],
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: homeController
                  .shopDescriptionList(shopItem.shop!.shopDescription)),
        ),
      ),
    ];
    for (var i = 0; i < shopItem.items!.length; i += 2) {
      if (shopItem.items!.isNotEmpty) {
        if (i + 2 <= shopItem.items!.length) {
          list.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardSearch(
                  elev: shopItem.items![i].evaluation,
                  id: shopItem.items![i].id,
                  image: shopItem.items![i].image,
                  itemName: shopItem.items![i].name,
                  price: shopItem.items![i].price,
                  shopName: shopItem.shop!.shopName,
                ),
                CardSearch(
                  elev: shopItem.items![i + 1].evaluation,
                  id: shopItem.items![i + 1].id,
                  image: shopItem.items![i + 1].image,
                  itemName: shopItem.items![i + 1].name,
                  price: shopItem.items![i + 1].price,
                  shopName: shopItem.shop!.shopName,
                ),
              ],
            ),
          );
        } else {
          list.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardSearch(
                  elev: shopItem.items![i].evaluation,
                  id: shopItem.items![i].id,
                  image: shopItem.items![i].image,
                  itemName: shopItem.items![i].name,
                  price: shopItem.items![i].price,
                  shopName: shopItem.shop!.shopName,
                ),
              ],
            ),
          );
        }
      }
    }
    list.add(Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.appbarcolor, width: 2),
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(
                shopItem.shop!.lateLocation, shopItem.shop!.longLocation),
            zoom: 16),
        markers: <Marker>{
          Marker(
              markerId: const MarkerId("0"),
              position: LatLng(
                  shopItem.shop!.lateLocation, shopItem.shop!.longLocation))
        },
      ),
    ));

    return list;
  }
}
