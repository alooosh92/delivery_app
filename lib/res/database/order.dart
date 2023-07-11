import 'dart:convert';
import 'package:delivery_app/res/database/api_uri.dart';
import 'package:http/http.dart' as http;

class Order {
  late double late;
  late double long;
  late String notes;
  late String localId;
  late double price;

  Order({
    required this.late,
    required this.long,
    required this.notes,
    required this.price,
    required this.localId,
  });
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      late: json["late"],
      long: json["long"],
      notes: json["notes"],
      price: json["price"],
      localId: json["locationId"],
    );
  }
  Map<String, dynamic> toJson() => {
        "late": late,
        "long": long,
        "notes": notes,
        "price": price,
        "locationId": localId,
      };
  static Future<bool> addOrder(Order order) async {
    var json = order.toJson();
    var body = jsonEncode(json);
    http.Response response =
        await http.post(Api.addOrder, body: body, headers: Api.getHeader());
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    return true;
  }
}
