import 'package:flutter/material.dart';
import '../../../master_widget/color.dart';

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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
