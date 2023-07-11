import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/master_widget/color.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
AppBar appBarDefult() {
  return AppBar(
    backgroundColor: ColorManager.appbarcolor,
    title: GetBuilder<HomeController>(
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
          hint: Text(
            Tr.deliveryTo.tr,
            style: const TextStyle(color: ColorManager.textWhite),
          ),
          value: controller.userlocationId,
          onChanged: (val) {
            controller.changeUserLocation(val!);
          },
          items: controller.buildLocationList(),
        );
      },
    ),
    actions: [
      GetBuilder<HomeController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Tr.points.tr,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: ColorManager.textWhite),
                    ),
                    Text(
                      controller.userinfo == null
                          ? ""
                          : controller.userinfo!.point!.round().toString(),
                      style: const TextStyle(
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
        );
      })
    ],
    leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen == false) {
            scaffoldKey.currentState!.openDrawer();
          } else {
            scaffoldKey.currentState!.openEndDrawer();
          }
        }),
  );
}
