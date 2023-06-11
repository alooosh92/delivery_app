import 'package:delivery_app/res/controller/appbar_controller.dart';
import 'package:delivery_app/res/controller/shop_controller.dart';
import 'package:delivery_app/res/master/api.dart';
import 'package:delivery_app/res/master/color.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../widget/text_form_field_search.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({
    super.key,
    required this.text,
    required this.shopList,
  });
  final String text;
  final List<Shop> shopList;
  @override
  Widget build(BuildContext context) {
    // ShopController controllar = Get.find();
    AppbarController appController = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormFieldSearch(
            text: text,
            onchanged: (val) {},
          ),
          GetX<ShopController>(
            builder: (controller) {
              List<Widget> list = [];
              for (var element in shopList) {
                double p = Geolocator.distanceBetween(
                  appController.rxLate.value,
                  appController.rxLong.value,
                  element.lateLocation,
                  element.longLocation,
                );
                var sh = ShopCard(
                  icon: element.urlLogo,
                  image: element.urlImage,
                  price: ((p / 1000).ceil()) * 1500,
                  type: element.type,
                  listDes: element.shopDescription,
                );
                list.add(sh);
              }
              return Column(
                children: list,
              );
            },
          )
        ],
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  const ShopCard(
      {super.key,
      required this.image,
      required this.icon,
      required this.type,
      required this.listDes,
      required this.price});
  final String image;
  final String icon;
  final String type;
  final List<String> listDes;
  final int price;
  @override
  Widget build(BuildContext context) {
    List<Widget> Lw = [];
    for (var element in listDes) {
      Lw.add(InfoCard(text: element));
    }
    return Container(
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
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
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
                      child: Image.network(icon),
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
                          type,
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
                          children: Lw,
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
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 25,
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
