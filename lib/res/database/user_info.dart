import 'package:delivery_app/res/database/region.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_uri.dart';

class Userinfo {
  late String id;
  late String name;
  late String mobile;
  late bool sex;
  late int region;
  late List<Region> lRegion;

  Userinfo({
    required this.id,
    required this.name,
    required this.mobile,
    required this.sex,
    required this.region,
  });
  factory Userinfo.fromJson(Map<String, dynamic> json) {
    return Userinfo(
      id: json["id"],
      name: json["name"],
      mobile: json["mobile"],
      sex: json["sex"],
      region: json["region"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "sex": sex,
        "region": region,
      };
  static Future<Userinfo?> getUserInfo() async {
    http.Response response =
        await http.get(Api.getUserInfo, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return null;
    }
    var body = jsonDecode(response.body);
    var info = Userinfo.fromJson(body);
    info.lRegion = await Region.getRegion();
    return info;
  }

  static Future<bool> updateUserInfo(Userinfo info) async {
    var json = info.toJson();
    var body = jsonEncode(json);
    http.Response response =
        await http.put(Api.updateUserInfo, headers: Api.header, body: body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
