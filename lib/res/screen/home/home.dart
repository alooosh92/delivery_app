import 'package:delivery_app/res/controller/pageview_controller.dart';
import 'package:delivery_app/res/screen/home/widget/accont.dart';
import 'package:delivery_app/res/screen/home/widget/qote.dart';
import 'package:delivery_app/res/screen/home/widget/restorant.dart';
import 'package:delivery_app/res/screen/home/widget/search.dart';
import 'package:delivery_app/res/screen/home/widget/shops.dart';
import 'package:delivery_app/res/screen/home/widget/user_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../master_widget/app_bar.dart';
import '../../master_widget/bottom_navigation_bar.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageviewController pageviewController = Get.find();
    return Scaffold(
      appBar: appBarDefult(),
      body: AccontBody(pageviewController: pageviewController),
      bottomNavigationBar: const BottomNavigationBarDefulte(),
    );
  }
}

class AccontBody extends StatelessWidget {
  const AccontBody({
    super.key,
    required this.pageviewController,
  });

  final PageviewController pageviewController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageviewController.pageController,
      onPageChanged: (value) {
        pageviewController.onScroll(value);
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return screen[index];
      },
    );
  }
}

List screen = [
  const HomeScreen(),
  const SearchScreen(),
  const RestorantScreen(),
  const ShopsScreen(),
  const UserOrderScreen(),
  const AccontScreen(),
];
