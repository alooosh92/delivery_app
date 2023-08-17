import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/database/user_info.dart';
import 'package:delivery_app/res/screen/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../database/auth.dart';
import '../screen/home/home.dart';

class AuthController extends GetxController {
  static void logout() async {
    HomeController homeController = Get.find();
    homeController.page = 0;
    homeController.userlocationId = null;
    homeController.userlocation = const LatLng(0, 0);
    homeController.locationsList = [];
    homeController.userinfo = null;
    homeController.qoteTodayList = [];
    homeController.itemList = [];
    homeController.restorantList = [];
    homeController.shopList = [];
    homeController.pageController =
        PageController(initialPage: 0, viewportFraction: 1);
    await AuthServies.logout();
    Get.offAll(const LoginScreen());
  }

  static Future<bool> login(String usernameS, String passwordS) async {
    var fb = FirebaseMessaging.instance;
    var tok = await fb.getToken();
    var b = await AuthServies.login(
        Auth(username: usernameS, password: passwordS, token: tok));
    if (b) {
      HomeController homeController = Get.find();
      homeController.getLocation();
      homeController.getUserInfo();
      homeController.getQoteToday();
      homeController.getItem();
      homeController.getshop();
      homeController.getUserInfo();
      Get.offAll(const MasterScreen());
      return true;
    }
    return false;
  }

  static Future<bool> register(String email, String password, String name,
      String mobile, bool? sex, int? region) async {
    var fb = FirebaseMessaging.instance;
    var tok = await fb.getToken();
    var r = await AuthServies.register(
        Auth(username: email, password: password, token: tok));
    if (r) {
      var i = await Userinfo.updateUserInfo(Userinfo(
          id: "id",
          name: name,
          mobile: mobile,
          sex: sex!,
          region: region!,
          point: 0));
      if (i) {
        HomeController homeController = Get.find();
        homeController.getLocation();
        homeController.getUserInfo();
        homeController.getQoteToday();
        homeController.getItem();
        homeController.getshop();
        homeController.getUserInfo();
        Get.offAll(const MasterScreen());
        return true;
      }
    }
    return false;
  }

  static Future<bool> forgetPassword(String email) async {
    var b = await AuthServies.forgetPassword(email);
    if (b) {
      Get.offAll(const LoginScreen());
    }
    return true;
  }

  static Future<bool> changePassword(
      String oldPassword, String newPassword) async {
    var b = await AuthServies.changePassword(oldPassword, newPassword);
    return b;
  }
}
