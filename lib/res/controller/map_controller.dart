import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../database/user_location.dart';
import '../master_widget/tr.dart';
import 'home_controller.dart';

class MapController extends GetxController {
  Position? position;
  Set<Marker> markers = {};

  void addMark(LatLng position) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: position));
    update();
  }

  Future<CameraPosition> findPosition() async {
    var po = await _determinePosition();
    var lo =
        CameraPosition(target: LatLng(po.latitude, po.longitude), zoom: 16);
    return lo;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(Tr.locationServicesAreDisabled.tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(Tr.locationPermissionsDenied.tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(Tr.locationPermissionsDenied.tr);
    }
    var l = await Geolocator.getCurrentPosition();
    return l;
  }

  Future<bool> addLocation(String description, LatLng latlng) async {
    var b = await UserLocation.addUserLocation(description, latlng);
    HomeController appcon = Get.find();
    appcon.getLocation();
    return b;
  }

  void clickMapButton() {
    MapController controller = Get.find();
    TextEditingController con = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: Text(Tr.addLocationName.tr),
        content: TextFormField(
          controller: con,
          decoration: InputDecoration(
              labelText: Tr.locationName.tr,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), gapPadding: 4)),
        ),
        actions: [
          ElevatedButton(
              onPressed: () async {
                var a = await controller.addLocation(
                    con.text, controller.markers.first.position);
                if (a) {
                  Get.back();
                  Get.back();
                }
              },
              child: Text(Tr.add.tr))
        ],
      ),
    );
  }
}
