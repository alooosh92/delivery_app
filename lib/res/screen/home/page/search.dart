import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../master_widget/card_search.dart';
import '../widget/text_form_field_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Column(
      children: [
        TextFormFieldSearch(
          text: 'مطعم, متجر, صنف...',
          onchanged: (val) {},
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.71,
          width: MediaQuery.of(context).size.width * 0.9,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              mainAxisExtent: 220,
            ),
            itemCount: homeController.itemList.length,
            itemBuilder: (context, index) {
              return CardSearch(
                elev: homeController.itemList[index].evaluation,
                id: homeController.itemList[index].id,
                image: homeController.itemList[index].image,
                itemName: homeController.itemList[index].name,
                price: homeController.itemList[index].price,
                shopName: homeController.itemList[index].shop,
              );
            },
          ),
        )
      ],
    );
  }
}
