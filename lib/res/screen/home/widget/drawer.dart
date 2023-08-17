import 'package:delivery_app/res/master_widget/color.dart';
import 'package:delivery_app/res/screen/home/widget/accont.dart';
import 'package:flutter/material.dart';

class DrawerDef extends StatelessWidget {
  const DrawerDef({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      shadowColor: ColorManager.appbarcolor,
      width: 300,
      child: AccontScreen(),
    );
  }
}
