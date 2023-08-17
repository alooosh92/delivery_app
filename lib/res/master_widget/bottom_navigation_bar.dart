import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'color.dart';

class BottomNavigationBarDefulte extends StatelessWidget {
  const BottomNavigationBarDefulte({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return BottomNavigationBar(
          selectedItemColor: ColorManager.buttonNavigationSelect,
          unselectedItemColor: ColorManager.buttonNavigationUnSelect,
          currentIndex: homeController.page,
          items: [
            bNBI(Icons.home, Tr.home.tr, () {
              controller.pageClick(0);
            }),
            bNBI(Icons.search, Tr.searchS.tr, () {
              controller.pageClick(1);
            }),
            bNBI(Icons.dining_outlined, Tr.restorant.tr, () {
              controller.pageClick(2);
            }),
            bNBI(Icons.store, Tr.store.tr, () {
              controller.pageClick(3);
            }),
            bNBI(Icons.shopping_cart_outlined, Tr.order.tr, () {
              controller.pageClick(4);
            }),
          ],
        );
      },
    );
  }

  BottomNavigationBarItem bNBI(IconData icon, String label, Function() press) =>
      BottomNavigationBarItem(
        icon: InkWell(
          onTap: press,
          child: Icon(
            icon,
          ),
        ),
        label: label,
      );
}
