import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/user_location_controller.dart';
import '../../../database/user_location.dart';
import '../../../master_widget/color.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.id,
    required this.name,
    required this.late,
    required this.long,
  });
  final String id;
  final String name;
  final double late;
  final double long;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2),
          boxShadow: const [
            BoxShadow(
                offset: Offset.zero,
                color: ColorManager.appbarcolor,
                spreadRadius: 2),
          ],
          color: Colors.white70),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Center(
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          SizedBox(
            height: 170,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(late, long),
                zoom: 16,
              ),
              markers: <Marker>{
                Marker(
                    markerId: const MarkerId("0"),
                    position: LatLng(late, long)),
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("تنبيه"),
                          content: const Text("هل أنت متأكد من حذف الموقع؟"),
                          actions: [
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red)),
                                onPressed: () async {
                                  var del =
                                      await UserLocation.deleteUserLocation(id);
                                  if (del) {
                                    UserLocationContoller co =
                                        Get.put(UserLocationContoller());
                                    co.delete();
                                  }
                                  Get.back();
                                },
                                child: const Text("حذف")),
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("إلغاء")),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Center(child: Icon(Icons.delete)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
