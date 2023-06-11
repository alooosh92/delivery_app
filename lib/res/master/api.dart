import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Api {
  static Map<String, String> header = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbkB0ZXN0LmNvbSIsImp0aSI6ImE0OTliMjQwLWQxMTQtNGZlOC04MTVlLTBiOTBjMDg3YmVjYyIsInVpZCI6ImJmYzc1N2RjLThiMmItNDgzMi1iZTFjLWY2NTZiMmY1NmMzZiIsInJvbGVzIjoiQWRtaW4iLCJleHAiOjE2ODY3MzczMDEsImlzcyI6IlNlY3VyZUFwaSIsImF1ZCI6IlNlY3VyZUFwaVVzZXIifQ.5aev8XLc-5mkkl_UArGpN9AyZW-T82ApuIaFupPOQw0",
    "Accept": "*/*",
    "Content-Type": "application/json"
  };
  static String hosting = "http://deliveryorder-001-site1.dtempurl.com/";
  static String master = "${hosting}api/";
  static String image = "${hosting}img/";
  static Uri getUserLocation = Uri.parse("${master}app/GetUserLocation");
  static Uri getQoteTody = Uri.parse("${master}app/GetTodayQotes");
  static Uri getShopRegion = Uri.parse("${master}app/GetShopsByRegion");
  static Uri addUserLocation = Uri.parse("${master}app/AddUserLocation");
  static Uri getItemByEvaluation =
      Uri.parse("${master}app/GetItemByEvaluation");
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
      locationLate: json["locationLate"],
      locationLong: json["locationLong"],
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

  QoteToday({required this.id, required this.imageUrl, required this.shoptype});

  factory QoteToday.fromJson(Map<String, dynamic> json) {
    return QoteToday(
      id: json['id'],
      imageUrl: "${Api.image}${json['imageUrl']}",
      shoptype: json['shoptype'],
    );
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
      lateLocation: json["lateLocation"],
      longLocation: json["longLocation"],
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
}

class ItemByEvaluation {
  late String id;
  late String name;
  late String shop;
  late double evaluation;
  late double price;
  late String image;

  ItemByEvaluation({
    required this.id,
    required this.name,
    required this.shop,
    required this.evaluation,
    required this.price,
    required this.image,
  });

  factory ItemByEvaluation.fromJson(Map<String, dynamic> json) {
    return ItemByEvaluation(
      id: json["id"],
      name: json["name"],
      shop: json["shop"],
      evaluation: json["evaluation"],
      price: double.parse(json["price"].toString()),
      image: "${Api.image}${json["image"]}",
    );
  }
  static Future<List<ItemByEvaluation>> getItemByEvaluation() async {
    http.Response response =
        await http.get(Api.getItemByEvaluation, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return List.empty();
    }
    var body = jsonDecode(response.body);
    List<ItemByEvaluation> list = [];
    for (var element in body) {
      var i = ItemByEvaluation.fromJson(element);
      list.add(i);
    }
    return list;
  }
}
