import 'package:delivery_app/res/controller/pageview_controller.dart';
import 'package:delivery_app/res/screen/Shop.dart';
import 'package:delivery_app/res/screen/accont.dart';
import 'package:delivery_app/res/screen/home.dart';
import 'package:delivery_app/res/screen/restorant.dart';
import 'package:delivery_app/res/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../master/app_bar.dart';
import '../master/bottom_navigation_bar.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageviewController pageviewController = Get.find();
    return Scaffold(
      appBar: appBarDefult(),
      body: PageView.builder(
        controller: pageviewController.pageController,
        onPageChanged: (value) {
          pageviewController.onScroll(value);
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return screen[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationBarDefulte(),
    );
  }
}

List screen = [
  const HomeScreen(),
  const SearchScreen(),
  const RestorantScreen(),
  const ShopScreen(),
  const AccontScreen(),
];
