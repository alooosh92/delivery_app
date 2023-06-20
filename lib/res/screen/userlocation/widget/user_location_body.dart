import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'location_card.dart';

class UserLocationBody extends StatelessWidget {
  const UserLocationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
      builder: (context) {
        return ListView.builder(
          itemCount: homeController.locationsList.length,
          itemBuilder: (BuildContext context, int index) {
            return LocationCard(
              id: homeController.locationsList[index].id,
              late: homeController.locationsList[index].locationLate,
              long: homeController.locationsList[index].locationLong,
              name: homeController.locationsList[index].description,
            );
          },
        );
      },
    );
  }
}
