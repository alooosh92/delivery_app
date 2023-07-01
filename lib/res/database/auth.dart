import 'dart:convert';
import 'package:delivery_app/res/database/api_uri.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class Auth {
  late String username;
  late String password;

  Auth({required this.username, required this.password});

  Map<String, dynamic> toJson() => {"username": username, "password": password};
}

class AuthServies {
  static Future<bool> userIslogin() async {
    var storeg = GetStorage();
    var token = storeg.read("token");
    if (token == null) {
      return false;
    }
    http.Response response =
        await http.get(Api.checkToken, headers: Api.getHeader());
    if (response.statusCode == 200) {
      return true;
    }
    var ref = storeg.read("refreshToken");
    var body = jsonEncode(ref);
    http.Response response2 =
        await http.post(Api.refreshToken, body: body, headers: Api.getHeader());
    if (response2.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    var json = jsonDecode(response2.body);
    storeg.write("token", json["token"]);
    storeg.write("refreshToken", json["refreshToken"]);
    return true;
  }

  static Future<bool> login(Auth auth) async {
    var json = auth.toJson();
    var body = jsonEncode(json);
    http.Response response =
        await http.post(Api.login, body: body, headers: Api.getHeader());
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    var bBody = jsonDecode(response.body);
    if (bBody["email"] == null) {
      return false;
    }
    var storg = GetStorage();
    storg.write("token", bBody["token"]);
    storg.write("refreshToken", bBody["refreshToken"]);
    return true;
  }

  static Future<bool> register(Auth auth) async {
    var json = auth.toJson();
    var body = jsonEncode(json);
    http.Response response =
        await http.post(Api.register, body: body, headers: Api.getHeader());
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    var bBody = jsonDecode(response.body);
    if (bBody["isAuthanticated"] == false) {
      return false;
    }
    var storg = GetStorage();
    storg.write("token", bBody["token"]);
    storg.write("refreshToken", bBody["refreshToken"]);
    return true;
  }

  static Future<bool> changePassword(
      String oldpassword, String newPassword) async {
    Map<String, dynamic> map = {
      "oldpassword": oldpassword,
      "newpassword": newPassword
    };
    var body = jsonEncode(map);
    http.Response response = await http.post(Api.changePassword,
        headers: Api.getHeader(), body: body);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    var bBody = jsonDecode(response.body);
    if (bBody["email"] == null) {
      return false;
    }
    var storg = GetStorage();
    storg.write("token", bBody["token"]);
    storg.write("refreshToken", bBody["refreshToken"]);
    return true;
  }

  static Future<bool> forgetPassword(String email) async {
    var body = jsonEncode(email);
    http.Response response = await http.post(Api.forgetPassword,
        headers: Api.getHeader(), body: body);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    return true;
  }

  static Future<bool> logout() async {
    var storg = GetStorage();
    var ref = storg.read("refreshToken");
    var body = jsonEncode(ref);
    http.Response response =
        await http.post(Api.revokeToken, body: body, headers: Api.getHeader());
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    storg.remove("token");
    storg.remove("refreshToken");
    return true;
  }
}
