import 'package:delivery_app/res/master/api.dart';
import 'package:delivery_app/res/screen/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppbarController extends GetxController {
  String? local;
  double late = 0;
  double long = 0;
  List<DropdownMenuItem<String>> list = [];
  List<UserLocation> userLocation = [];
  void changeLocal(String? localDelever) {
    local = localDelever;
    var lo = userLocation.firstWhere((element) => element.id == localDelever);
    late = lo.locationLate;
    long = lo.locationLong;
    update();
  }

  void getLocation() async {
    list.clear();
    list.add(dropdownMenuItemDefAdd());
    var loc = await UserLocation.getUserLocation();
    for (var l in loc) {
      var d = dropdownMenuItemDef(
          l.id, l.locationLate, l.locationLong, l.description);
      var u = UserLocation(
        id: l.id,
        description: l.description,
        locationLate: l.locationLate,
        locationLong: l.locationLong,
      );
      userLocation.add(u);
      list.add(d);
    }
  }

  @override
  void onInit() async {
    getLocation();
    super.onInit();
  }

  List<DropdownMenuItem<String>> allLocation() {
    return list;
  }
}

DropdownMenuItem<String> dropdownMenuItemDefAdd() {
  return DropdownMenuItem<String>(
    value: '0',
    child: InkWell(
      onTap: () {
        Get.to(
          MapScreen(text: 'إضافة الموقع محدد إلى المفضلة', press: () {}),
        );
      },
      child: const Row(
        children: [
          Icon(Icons.add_box_outlined),
          Text('إضافة موقع جديد'),
        ],
      ),
    ),
  );
}

DropdownMenuItem<String> dropdownMenuItemDef(
    String id, double late, double long, String text) {
  return DropdownMenuItem<String>(
    value: id,
    child: InkWell(
      onTap: () {
        var k = GetStorage();
        k.write('location', id);
      },
      child: Row(
        children: [
          Text(text),
        ],
      ),
    ),
  );
}
