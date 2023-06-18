import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';

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
