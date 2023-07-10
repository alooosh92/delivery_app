import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/region.dart';
import '../database/user_info.dart';
import '../master_widget/tr.dart';

class UserInfoController extends GetxController {
  List<DropdownMenuItem<int>> getRegionlist(List<Region> regions) {
    List<DropdownMenuItem<int>> list = [];
    for (var element in regions) {
      var d = DropdownMenuItem<int>(
        value: element.id,
        child: Text(element.regionName),
      );
      list.add(d);
    }
    return list;
  }

  void clickSaveButton(Userinfo userinfo) async {
    var b = await Userinfo.updateUserInfo(userinfo);
    if (b) {
      Get.defaultDialog(
        title: Tr.information.tr,
        content: Text(Tr.dataHasUpdated.tr),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text(Tr.ok.tr))
        ],
      );
    }
  }

  void clickCanselButton() async {
    Get.back();
  }
}
