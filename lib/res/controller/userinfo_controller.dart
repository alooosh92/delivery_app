import 'package:get/get.dart';
import '../database/user_info.dart';

class UserInfoController extends GetxController {
  void updateInfo(Userinfo info) async {
    await Userinfo.updateUserInfo(info);
    update();
  }
}
