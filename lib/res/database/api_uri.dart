class Api {
  static Map<String, String> header = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbkB0ZXN0LmNvbSIsImp0aSI6Ijk2YjMwYmMxLTkwYmQtNDQ2NC05YzBkLTkwYThjY2JmODI0OCIsInVpZCI6IjhhYjhjOThkLTAzOTgtNDUxMi05NWFmLTFjNjg4ZmRhNjExNSIsInJvbGVzIjoiQWRtaW4iLCJleHAiOjE2ODcxNzQwOTcsImlzcyI6IlNlY3VyZUFwaSIsImF1ZCI6IlNlY3VyZUFwaVVzZXIifQ.KYyPBTXmPuGmfJwBih8yijwBMvZBiyvT6Atgq_u63ic",
    "Accept": "*/*",
    "Content-Type": "application/json"
  };
  static String hosting = "http://10.0.2.2:5000/";
  //"http://deliveryorder-001-site1.dtempurl.com/";
  static String master = "${hosting}api/";
  static String image = "${hosting}img/";
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
}
