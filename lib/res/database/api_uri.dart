import 'package:get_storage/get_storage.dart';

var storage = GetStorage();

class Api {
  static String hosting = "http://10.0.2.2:5000/";
  //"http://deliveryorder-001-site1.dtempurl.com/";
  //"http://10.0.2.2:5000/";
  static String master = "${hosting}api/";
  static String image = "${hosting}img/";
  static String auth = "${hosting}img/";
  static Uri getUserLocation = Uri.parse("${master}app/GetUserLocation");
  static Uri getQoteTody = Uri.parse("${master}app/GetTodayQotes");
  static Uri getShopRegion = Uri.parse("${master}app/GetShopsByRegion");
  static Uri addUserLocation = Uri.parse("${master}app/AddUserLocation");
  static Uri getUserInfo = Uri.parse("${master}app/GetUserInfo");
  static Uri updateUserInfo = Uri.parse("${master}app/UpdateUserInfo");
  static Uri getItemByEvaluation =
      Uri.parse("${master}app/GetItemByEvaluation");
  static Uri getRegion = Uri.parse("${master}app/GetRegions");
  static Uri getUserOrder = Uri.parse("${master}app/GetUserOrder");
  static Uri getItemShop = Uri.parse("${master}app/GetItemByShop");
  static Uri getShop = Uri.parse("${master}app/GetShop");
  static Uri getItemInfo = Uri.parse("${master}app/GetItemInof");
  static Uri deleteUserllocation = Uri.parse("${master}app/DeleteUserLocation");
  static Uri bayItem = Uri.parse("${master}App/AddItemToOrder");
  static Uri orderDone = Uri.parse("${master}App/OrderDone");
  static Uri deleteOrder = Uri.parse("${master}App/DeleteOrder");
  static Uri checkToken = Uri.parse("${master}Authentication/CheckToken");
  static Uri refreshToken = Uri.parse("${master}Authentication/RefreshToken");
  static Uri login = Uri.parse("${master}Authentication/Login");
  static Uri register = Uri.parse("${master}Authentication/Register");
  static Uri revokeToken = Uri.parse("${master}Authentication/RevokeToken");
  static Map<String, String> getHeader() {
    var token = storage.read("token");
    return {
      "Authorization": "Bearer $token",
      "Accept": "*/*",
      "Content-Type": "application/json"
    };
  }
}
