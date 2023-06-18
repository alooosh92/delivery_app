import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'api_uri.dart';

class UserLocation {
  late String id;
  late double locationLate;
  late double locationLong;
  late String description;

  UserLocation(
      {required this.id,
      required this.description,
      required this.locationLate,
      required this.locationLong});

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      id: json["id"],
      description: json["description"],
      locationLate: double.parse(json["locationLate"].toString()),
      locationLong: double.parse(json["locationLong"].toString()),
    );
  }
  static Future<List<UserLocation>> getUserLocation() async {
    http.Response response =
        await http.get(Api.getUserLocation, headers: Api.header);
    List<UserLocation> lUL = [];
    if (response.statusCode != 200 || response.body.isEmpty) return lUL;
    var body = jsonDecode(response.body);
    for (var element in body) {
      var loc = UserLocation.fromJson(element);
      lUL.add(loc);
    }
    return lUL;
  }

  static Future<bool> addUserLocation(String description, LatLng latlng) async {
    Map<String, dynamic> json = {
      "locationLate": latlng.latitude,
      "locationLong": latlng.longitude,
      "description": description,
      "user": "string"
    };
    var body = jsonEncode(json);
    http.Response response =
        await http.post(Api.addUserLocation, headers: Api.header, body: body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> deleteUserLocation(String id) async {
    var body = jsonEncode(id);
    http.Response response = await http.delete(Api.deleteUserllocation,
        body: body, headers: Api.header);
    if (response.statusCode != 200 || response.body.isEmpty) {
      return false;
    }
    return true;
  }
}
