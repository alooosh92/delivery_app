import 'package:delivery_app/res/controller/appbar_controller.dart';
import 'package:delivery_app/res/master/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

AppBar appBarDefult() {
  return AppBar(
    backgroundColor: ColorManager.appbarcolor,
    title: GetBuilder<AppbarController>(
      builder: (controller) {
        return DropdownButton<String>(
          underline: const DropdownButtonHideUnderline(child: Text('')),
          style: const TextStyle(color: ColorManager.textWhite),
          dropdownColor: ColorManager.appbarcolor,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: ColorManager.textWhite,
          ),
          isExpanded: true,
          hint: const Text(
            'التوصيل إلى...',
            style: TextStyle(color: ColorManager.textWhite),
          ),
          value: controller.local,
          onChanged: (val) {
            controller.changeLocal(val);
          },
          items: controller.allLocation(),
        );
      },
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'نقاطي',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.textWhite),
                  ),
                  Text(
                    '900',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.textWhite),
                  )
                ],
              ),
            ),
            const InkWell(
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
      )
    ],
  );
}
