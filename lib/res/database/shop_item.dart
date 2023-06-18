import 'package:delivery_app/res/database/shop.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';
import 'item.dart';

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
