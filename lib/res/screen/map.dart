import 'package:delivery_app/res/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.text, required this.press});
  final String text;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());
    // ignore: unused_local_variable
    GoogleMapController controllerGM;
    Set<Polyline> polyLineList = {};
    return Scaffold(
      body: FutureBuilder<CameraPosition>(
        future: controller.findPosition(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GetBuilder<MapController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: GoogleMap(
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        polylines: polyLineList,
                        onTap: (argument) {
                          controller.addMark(argument);
                        },
                        markers: controller.markers,
                        mapType: MapType.normal,
                        initialCameraPosition: snapshot.data!,
                        onMapCreated: (GoogleMapController controller) {
                          controllerGM = controller;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: controller.markers.isEmpty
                              ? null
                              : () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      TextEditingController con =
                                          TextEditingController();
                                      return AlertDialog(
                                        title: const Text(
                                            "الرجاء ادخال اسم توضيحي للموقع"),
                                        content: TextFormField(
                                          controller: con,
                                          decoration: InputDecoration(
                                              labelText: "الاسم التوضيحي",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gapPadding: 4)),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () async {
                                                var a = await controller
                                                    .addLocation(
                                                        con.text,
                                                        controller.markers.first
                                                            .position);
                                                if (a) {
                                                  Get.back();
                                                  Get.back();
                                                }
                                              },
                                              child: const Text("إضافة"))
                                        ],
                                      );
                                    },
                                  );
                                },
                          child: Text(text)),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// void polyline(PointLatLng x, PointLatLng y) async {
//   PolylinePoints polylinePoints = PolylinePoints();
//   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyDusv11SdhBYMjIZ2W2nOOwFWJQ8SS4wjc', x, y,
//       travelMode: TravelMode.bicycling);
//   var r = result.points;  
//   print(result.points);
// }
