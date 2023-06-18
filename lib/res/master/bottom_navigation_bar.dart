import 'package:delivery_app/res/controller/navigationbar_controller.dart';
import 'package:delivery_app/res/master/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BottomNavigationBarDefulte extends StatelessWidget {
  const BottomNavigationBarDefulte({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationbarController>(
      builder: (controller) {
        return BottomNavigationBar(
          selectedItemColor: ColorManager.buttonNavigationSelect,
          unselectedItemColor: ColorManager.buttonNavigationUnSelect,
          currentIndex: controller.page,
          items: [
            bNBI(Icons.home, 'Home', () {
              controller.pageClick(0);
            }),
            bNBI(Icons.search, 'Search', () {
              controller.pageClick(1);
            }),
            bNBI(Icons.dining_outlined, 'Restorant', () {
              controller.pageClick(2);
            }),
            bNBI(Icons.store, 'Store', () {
              controller.pageClick(3);
            }),
            bNBI(Icons.shopping_cart_outlined, 'Order', () {
              controller.pageClick(4);
            }),
            bNBI(Icons.person, 'Acconte', () {
              controller.pageClick(5);
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
