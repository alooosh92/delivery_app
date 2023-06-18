import 'package:delivery_app/res/master/color.dart';
import 'package:delivery_app/res/screen/user_info.dart';
import 'package:delivery_app/res/screen/user_location.dart';
import 'package:delivery_app/res/screen/user_order.dart';
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

class ElevateButtonAccont extends StatelessWidget {
  const ElevateButtonAccont(
      {super.key, required this.text, required this.press});
  final String text;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 233, 234, 240),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: ColorManager.appbarcolor,
                  offset: Offset.zero)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: ColorManager.accontButtonText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorManager.accontButtonText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
