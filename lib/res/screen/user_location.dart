import 'package:delivery_app/res/controller/appbar_controller.dart';
import 'package:delivery_app/res/controller/user_location_controller.dart';
import 'package:delivery_app/res/master/api.dart';
import 'package:delivery_app/res/master/app_bar.dart';
import 'package:delivery_app/res/master/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserLocationScreen extends StatelessWidget {
  const UserLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefult(),
      body: GetBuilder<UserLocationContoller>(
          init: UserLocationContoller(),
          builder: (context) {
            return FutureBuilder<List<UserLocation>>(
                initialData: null,
                future: UserLocation.getUserLocation(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LocationCard(
                        id: snapshot.data![index].id,
                        late: snapshot.data![index].locationLate,
                        long: snapshot.data![index].locationLong,
                        name: snapshot.data![index].description,
                      );
                    },
                  );
                });
          }),
    );
  }
}

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
