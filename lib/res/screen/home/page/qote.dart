import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/add_order_in_map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AddOrderInMap(),
            GetBuilder<HomeController>(
              builder: (controller) {
                return Column(children: homeController.qoteListScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
