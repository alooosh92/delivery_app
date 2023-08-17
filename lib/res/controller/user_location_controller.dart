import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/user_location.dart';
import '../master_widget/tr.dart';

class UserLocationController extends GetxController {
  void clickDeleteButton(String id) {
    Get.dialog(AlertDialog(
      title: Text(Tr.warning.tr),
      content: Text(Tr.deleteLocation.tr),
      actions: [
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            onPressed: () async {
              var del = await UserLocation.deleteUserLocation(id);
              if (del) {
                HomeController homeController = Get.find();
                homeController.userlocationId = null;
                homeController.getLocation();
                update();
              }
              Get.back();
            },
            child: Text(Tr.delete.tr)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(Tr.cancel.tr)),
      ],
    ));
  }
}
