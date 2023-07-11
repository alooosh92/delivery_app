import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';

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
        shopname: json["shopName"] ?? "",
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
        await http.get(Api.getUserOrder, headers: Api.getHeader());
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

  static Future<bool> doneOrder(String id) async {
    var body = jsonEncode(id);
    http.Response response =
        await http.put(Api.orderDone, body: body, headers: Api.getHeader());
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    return true;
  }

  static Future<bool> deleteOrder(String id) async {
    var body = jsonEncode(id);
    http.Response response = await http.delete(Api.deleteOrder,
        body: body, headers: Api.getHeader());
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    return true;
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
