import 'package:delivery_app/res/controller/appbar_controller.dart';
import 'package:delivery_app/res/master/api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var l = await Geolocator.getCurrentPosition();
    return l;
  }

  Future<bool> addLocation(String description, LatLng latlng) async {
    var b = await UserLocation.addUserLocation(description, latlng);
    AppbarController appcon = Get.find();
    appcon.getLocation();
    return b;
  }
}
