import 'package:delivery_app/res/controller/auth_controller.dart';
import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:delivery_app/res/screen/home/widget/elevate_button_accont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccontScreen extends StatelessWidget {
  const AccontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevateButtonAccont(
                      text: Tr.editProfile.tr,
                      press: homeController.clickBtnUserInfoScreen),
                  ElevateButtonAccont(
                      text: Tr.myLocation.tr,
                      press: homeController.clickBtnUserLocationScreen),
                  ElevateButtonAccont(
                      text: Tr.changePassword.tr,
                      press: homeController.clickBtnChangepassword),
                  ElevateButtonAccont(
                      text: Tr.settings.tr,
                      press: homeController.clickBtnSetting),
                  ElevateButtonAccont(
                      text: Tr.conectUs.tr,
                      press: homeController.clickBtnConuctUs),
                  ElevateButtonAccont(
                      text: Tr.logout.tr,
                      press: () async {
                        AuthController.logout();
                        Get.back();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
