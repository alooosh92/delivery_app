import 'package:get/get.dart';

import '../master/api.dart';

class UserInfoController extends GetxController {
  void updateInfo(Userinfo info) async {
    await Userinfo.updateUserInfo(info);
    update();
  }
}
