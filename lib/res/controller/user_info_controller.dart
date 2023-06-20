import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/region.dart';
import '../database/user_info.dart';

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
        title: "معلومات",
        content: const Text("تمت تعديل المعلومات بنجاح"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("موافق"))
        ],
      );
    }
  }

  void clickCanselButton() async {
    Get.back();
  }
}
