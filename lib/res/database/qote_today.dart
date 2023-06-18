import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_uri.dart';

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
