import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';

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
