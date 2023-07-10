import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/database/item.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../master_widget/card_search.dart';
import '../widget/text_form_field_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    List<Item> list = homeController.itemList;
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormFieldSearch(
            text: Tr.shopRestorant.tr,
            onchanged: (val) {
              if (val.isNotEmpty) {
                list = homeController.itemList
                    .where((element) =>
                        element.name.contains(val) ||
                        element.shop.contains(val))
                    .toList();
                homeController.update();
              } else {
                list = homeController.itemList;
                homeController.update();
              }
            },
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.71,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      mainAxisExtent: 220,
                    ),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return CardSearch(
                        elev: list[index].evaluation,
                        id: list[index].id,
                        image: list[index].image,
                        itemName: list[index].name,
                        price: list[index].price,
                        shopName: list[index].shop,
                      );
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
