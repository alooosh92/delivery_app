import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';

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
