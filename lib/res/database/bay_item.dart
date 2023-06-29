import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';

class BayItem {
  late String item;
  late int numberOfItem;
  late String? notes;
  late String locationId;
  late double price;
  BayItem({
    required this.item,
    required this.numberOfItem,
    required this.notes,
    required this.locationId,
    required this.price,
  });
  factory BayItem.fromJson(Map<String, dynamic> json) {
    return BayItem(
        item: json["item"],
        numberOfItem: json["numberOfItem"],
        notes: json["notes"],
        locationId: json["locationId"],
        price: json["price"]);
  }
  Map<String, dynamic> tojson() => {
        "item": item,
        "numberOfItem": numberOfItem,
        "notes": notes,
        "locationId": locationId,
        "price": price,
      };
  static Future<bool> bayItem(BayItem item) async {
    var json = item.tojson();
    var body = jsonEncode(json);
    http.Response response =
        await http.post(Api.bayItem, body: body, headers: Api.getHeader());
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    return true;
  }
}
