import 'package:delivery_app/res/screen/home/widget/elevate_button_accont.dart';
import 'package:delivery_app/res/screen/userinfo/user_info.dart';
import 'package:delivery_app/res/screen/userlocation/user_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccontScreen extends StatelessWidget {
  const AccontScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    text: 'تعديل ملفك الشخصي',
                    press: () {
                      Get.to(const UserInfoScreen());
                    },
                  ),
                  ElevateButtonAccont(
                    text: 'عناويني',
                    press: () {
                      Get.to(const UserLocationScreen());
                    },
                  ),
                  ElevateButtonAccont(
                    text: 'الإعدادات',
                    press: () {},
                  ),
                  ElevateButtonAccont(
                    text: 'تواصل معنا',
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
