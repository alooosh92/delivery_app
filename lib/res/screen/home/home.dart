import 'package:delivery_app/res/controller/pageview_controller.dart';
import 'package:delivery_app/res/screen/home/widget/accont_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../master_widget/app_bar.dart';
import '../../master_widget/bottom_navigation_bar.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageviewController pageviewController = Get.find();
    return Scaffold(
      appBar: appBarDefult(),
      body: AccontBody(pageviewController: pageviewController),
      bottomNavigationBar: const BottomNavigationBarDefulte(),
    );
  }
}
