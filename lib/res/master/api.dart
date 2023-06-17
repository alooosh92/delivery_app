import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

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
}

class UserLocation {
  late String id;
  late double locationLate;
  late double locationLong;
  late String description;

  UserLocation(
      {required this.id,
      required this.description,
      required this.locationLate,
      required this.locationLong});

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      id: json["id"],
      description: json["description"],
      locationLate: double.parse(json["locationLate"].toString()),
      locationLong: double.parse(json["locationLong"].toString()),
    );
  }
  static Future<List<UserLocation>> getUserLocation() async {
    http.Response response =
        await http.get(Api.getUserLocation, headers: Api.header);
    List<UserLocation> lUL = [];
    if (response.statusCode != 200 || response.body.isEmpty) return lUL;
    var body = jsonDecode(response.body);
    for (var element in body) {
      var loc = UserLocation.fromJson(element);
      lUL.add(loc);
    }
    return lUL;
  }

  static Future<bool> addUserLocation(String description, LatLng latlng) async {
    Map<String, dynamic> json = {
      "locationLate": latlng.latitude,
      "locationLong": latlng.longitude,
      "description": description,
      "user": "string"
    };
    var body = jsonEncode(json);
    http.Response response =
        await http.post(Api.addUserLocation, headers: Api.header, body: body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}

class QoteToday {
  late String id;
  late String imageUrl;
  late String shoptype;
  late String shopId;

  QoteToday(
      {required this.id,
      required this.imageUrl,
      required this.shoptype,
      required this.shopId});

  factory QoteToday.fromJson(Map<String, dynamic> json) {
    return QoteToday(
        id: json['id'],
        imageUrl: "${Api.image}${json['imageUrl']}",
        shoptype: json['shoptype'],
        shopId: json['shopId']);
  }

  static Future<List<QoteToday>> getQoteToday() async {
    http.Response response =
        await http.get(Api.getQoteTody, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return List.empty();
    }
    List<QoteToday> list = [];
    var body = jsonDecode(response.body);
    for (var element in body) {
      list.add(QoteToday.fromJson(element));
    }
    return list;
  }
}

class Shop {
  late String id;
  late String shopName;
  late String urlImage;
  late String urlLogo;
  late String type;
  late bool isFood;
  late List<String> shopDescription;
  late double lateLocation;
  late double longLocation;
  late double evaluation;
  late double residentsNumber;

  Shop(
      {required this.id,
      required this.shopName,
      required this.urlImage,
      required this.urlLogo,
      required this.type,
      required this.isFood,
      required this.shopDescription,
      required this.lateLocation,
      required this.longLocation,
      required this.evaluation,
      required this.residentsNumber});
  factory Shop.fromJson(Map<String, dynamic> json) {
    List<String> des = [];
    for (var element in json["shopDescription"]) {
      des.add(element.toString());
    }
    return Shop(
      id: json["id"],
      shopName: json["shopName"],
      urlImage: json["urlImage"],
      urlLogo: json["urlLogo"],
      type: json["type"],
      isFood: json["isFood"],
      shopDescription: des,
      lateLocation: double.parse(json["lateLocation"].toString()),
      longLocation: double.parse(json["longLocation"].toString()),
      evaluation: double.parse(json["evaluation"].toString()),
      residentsNumber: double.parse(json["residentsNumber"].toString()),
    );
  }
  static Future<List<Shop>> getShopRegion() async {
    http.Response response =
        await http.get(Api.getShopRegion, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return List.empty();
    }
    List<Shop> list = [];
    var body = jsonDecode(response.body);
    for (var element in body) {
      Shop s = Shop.fromJson(element);
      s.urlImage = "${Api.image}${s.urlImage}";
      s.urlLogo = "${Api.image}${s.urlLogo}";
      list.add(s);
    }
    return list;
  }

  static Future<Shop?> getShop(String id) async {
    var json = jsonEncode(id);
    http.Response response =
        await http.post(Api.getItemShop, headers: Api.header, body: json);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return null;
    }
    var body = jsonDecode(response.body);
    Shop s = Shop.fromJson(body);
    s.urlImage = "${Api.image}${s.urlImage}";
    s.urlLogo = "${Api.image}${s.urlLogo}";
    return s;
  }
}

class Item {
  late String id;
  late String name;
  late String shop;
  late double evaluation;
  late double price;
  late String image;

  Item({
    required this.id,
    required this.name,
    required this.shop,
    required this.evaluation,
    required this.price,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      name: json["name"],
      shop: json["shop"],
      evaluation: double.parse(json["evaluation"].toString()),
      price: double.parse(json["price"].toString()),
      image: "${Api.image}${json["image"]}",
    );
  }
  static Future<List<Item>> getItemByEvaluation() async {
    http.Response response =
        await http.get(Api.getItemByEvaluation, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return List.empty();
    }
    var body = jsonDecode(response.body);
    List<Item> list = [];
    for (var element in body) {
      var i = Item.fromJson(element);
      list.add(i);
    }
    return list;
  }

  static Future<List<Item>> getItemByShop(String id) async {
    var json = jsonEncode(id);
    http.Response response =
        await http.post(Api.getItemShop, headers: Api.header, body: json);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return List.empty();
    }
    var body = jsonDecode(response.body);
    List<Item> list = [];
    for (var element in body) {
      var i = Item.fromJson(element);
      list.add(i);
    }
    return list;
  }
}

class Userinfo {
  late String id;
  late String name;
  late String mobile;
  late bool sex;
  late int region;
  late List<Region> lRegion;

  Userinfo({
    required this.id,
    required this.name,
    required this.mobile,
    required this.sex,
    required this.region,
  });
  factory Userinfo.fromJson(Map<String, dynamic> json) {
    return Userinfo(
      id: json["id"],
      name: json["name"],
      mobile: json["mobile"],
      sex: json["sex"],
      region: json["region"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "sex": sex,
        "region": region,
      };
  static Future<Userinfo?> getUserInfo() async {
    http.Response response =
        await http.get(Api.getUserInfo, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return null;
    }
    var body = jsonDecode(response.body);
    var info = Userinfo.fromJson(body);
    info.lRegion = await Region.getRegion();
    return info;
  }

  static Future<bool> updateUserInfo(Userinfo info) async {
    var json = info.toJson();
    var body = jsonEncode(json);
    http.Response response =
        await http.put(Api.updateUserInfo, headers: Api.header, body: body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}

class Region {
  late int id;
  late String regionName;

  Region({
    required this.id,
    required this.regionName,
  });
  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(id: json["id"], regionName: json["regionName"]);
  }
  static Future<List<Region>> getRegion() async {
    http.Response response = await http.get(Api.getRegion, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return List.empty();
    }
    List<Region> lRegion = [];
    var body = jsonDecode(response.body);
    for (var element in body) {
      var re = Region.fromJson(element);
      lRegion.add(re);
    }
    return lRegion;
  }
}

class TabelRowItem {
  late String item;
  late int number;
  late int price;

  TabelRowItem({
    required this.item,
    required this.number,
    required this.price,
  });
  factory TabelRowItem.fromJson(Map<String, dynamic> json) {
    return TabelRowItem(
        item: json["itemName"], number: json["number"], price: json["price"]);
  }
}

class UserOrder {
  late String id;
  late String shopname;
  late List<TabelRowItem> listOrder;
  late int delivery;
  late DateTime createTime;
  late DateTime? confirmOrder;
  late DateTime? accseptOrder;
  late DateTime? deliveryTime;
  late int code;

  UserOrder(
      {required this.id,
      required this.shopname,
      required this.listOrder,
      required this.delivery,
      required this.createTime,
      required this.confirmOrder,
      required this.accseptOrder,
      required this.deliveryTime,
      required this.code});
  factory UserOrder.fromJson(Map<String, dynamic> json) {
    List<TabelRowItem> list = [];
    for (var element in json["listOrder"]) {
      list.add(TabelRowItem.fromJson(element));
    }
    return UserOrder(
        id: json["id"],
        shopname: json["shopName"],
        listOrder: list,
        delivery: json["delivery"],
        createTime: DateTime.parse(json["createDate"].toString()),
        confirmOrder: DateTime.tryParse(json["confirmOrder"].toString()),
        accseptOrder: DateTime.tryParse(json["accseptOrder"].toString()),
        deliveryTime: DateTime.tryParse(json["deliveryTime"].toString()),
        code: json["code"]);
  }

  static Future<List<UserOrder>> getUserOrder() async {
    http.Response response =
        await http.get(Api.getUserOrder, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return List.empty();
    }
    var body = jsonDecode(response.body);
    List<UserOrder> list = [];
    for (var element in body) {
      var e = UserOrder.fromJson(element);
      list.add(e);
    }
    return list;
  }
}

class ShopItem {
  late Shop? shop;
  late List<Item>? items;
  ShopItem({
    required this.shop,
    required this.items,
  });
  factory ShopItem.fromJson(Map<String, dynamic> json) {
    List<Item> items = [];
    for (var element in json["listItem"]) {
      items.add(Item.fromJson(element));
    }
    return ShopItem(
      shop: Shop.fromJson(json["shop"]),
      items: items,
    );
  }
  static Future<ShopItem?> getShop(String id) async {
    var json = jsonEncode(id);
    http.Response response =
        await http.post(Api.getShop, headers: Api.header, body: json);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return null;
    }
    var body = jsonDecode(response.body);
    ShopItem s = ShopItem.fromJson(body);
    s.shop!.urlImage = "${Api.image}${s.shop!.urlImage}";
    s.shop!.urlLogo = "${Api.image}${s.shop!.urlLogo}";
    return s;
  }
}

class ItemInfo {
  late String id;
  late String name;
  late String info;
  late double price;
  late double shopLate;
  late double shopLong;
  late double evaluation;
  late String image;
  late String shopid;

  ItemInfo(
      {required this.id,
      required this.name,
      required this.info,
      required this.price,
      required this.shopLate,
      required this.shopLong,
      required this.evaluation,
      required this.image,
      required this.shopid});
  factory ItemInfo.fromJson(Map<String, dynamic> json) {
    return ItemInfo(
        id: json["id"],
        name: json["name"],
        info: json["info"],
        price: double.parse(json["price"].toString()),
        shopLate: double.parse(json["shopLate"].toString()),
        shopLong: double.parse(json["shopLong"].toString()),
        evaluation: double.parse(json["evaluation"].toString()),
        image: "${Api.image}${json["image"]}",
        shopid: json["shopid"]);
  }
  static Future<ItemInfo?> getItemInfo(String id) async {
    var body = jsonEncode(id);
    http.Response response =
        await http.post(Api.getItemInfo, body: body, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return null;
    }
    var item = ItemInfo.fromJson(jsonDecode(response.body));
    return item;
  }
}
