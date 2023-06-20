import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/user_location.dart';

class UserLocationController extends GetxController {
  void clickDeleteButton(String id) {
    Get.dialog(AlertDialog(
      title: const Text("تنبيه"),
      content: const Text("هل أنت متأكد من حذف الموقع؟"),
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
            child: const Text("حذف")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("إلغاء")),
      ],
    ));
  }
}
