import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../master_widget/color.dart';

class AddOrderInMap extends StatelessWidget {
  const AddOrderInMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return ElevatedButton.icon(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(10),
          shadowColor: const MaterialStatePropertyAll(ColorManager.appbarcolor),
          fixedSize: MaterialStatePropertyAll(
            Size(MediaQuery.of(context).size.width * 0.9, 40),
          ),
          backgroundColor:
              const MaterialStatePropertyAll(ColorManager.textWhite)),
      onPressed: homeController.clickBtnAddRequstInMap,
      icon: const Icon(Icons.add_box_outlined, color: Colors.black),
      label: Text(
        Tr.addOrderInMap.tr,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
      ),
    );
  }
}
