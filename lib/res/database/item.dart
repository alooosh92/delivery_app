import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';

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
