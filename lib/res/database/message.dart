import 'dart:convert';

import 'package:delivery_app/res/database/api_uri.dart';
import 'package:http/http.dart' as http;

class Message {
  late String token;
  late String message;
  late String title;

  Message({required this.message, required this.title, required this.token});
  Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
        "title": title,
      };

  Future<bool> sendMessage(Message message) async {
    var body = jsonEncode(message);
    http.Response response =
        await http.post(Api.sendMessage, headers: Api.getHeader(), body: body);
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return true;
    }
    return false;
  }
}
