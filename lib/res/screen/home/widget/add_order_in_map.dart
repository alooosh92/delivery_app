import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/controller/map_controller.dart';
import 'package:delivery_app/res/database/order.dart';
import 'package:delivery_app/res/master_widget/show_dialog_def.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:delivery_app/res/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../master_widget/color.dart';
import '../../map/map.dart';

class AddOrderInMap extends StatelessWidget {
  const AddOrderInMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return ElevatedButton.icon(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(10),
          shadowColor: const MaterialStatePropertyAll(ColorManager.appbarcolor),
          fixedSize: MaterialStatePropertyAll(
            Size(MediaQuery.of(context).size.width * 0.9, 40),
          ),
          backgroundColor:
              const MaterialStatePropertyAll(ColorManager.textWhite)),
      onPressed: () async {
        if (homeController.userlocationId == null) {
          showDialogDef(
            ok: () {
              Get.back();
            },
            okText: Tr.ok.tr,
            title: Tr.warning.tr,
            masseg: Tr.selectLocation.tr,
          );
        } else {
          Get.to(MapScreen(
              text: Tr.placeToReceive.tr,
              press: () async {
                TextEditingController not = TextEditingController();
                MapController mapController = Get.find();
                var loc = mapController.markers.first;
                var p = homeController.getPriceBetweenToPoint(LatLng(
                  loc.position.latitude,
                  loc.position.longitude,
                ));
                final formkey = GlobalKey<FormState>();
                Get.dialog(AlertDialog(
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            Get.dialog(const Center(
                              child: CircularProgressIndicator(),
                            ));
                            Order o = Order(
                                late: loc.position.latitude,
                                long: loc.position.longitude,
                                notes: not.text,
                                price: double.parse(p),
                                localId: homeController.userlocationId!);
                            var b = await Order.addOrder(o);
                            if (b) {
                              Get.off(const MasterScreen());
                            }
                          }
                        },
                        child: Text(Tr.ok.tr)),
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(Tr.cancel.tr)),
                  ],
                  title: Text(Tr.notes.tr),
                  content: Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Tr.notesOrder.tr),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value == "") {
                              return Tr.notEmpty.tr;
                            }
                            return null;
                          },
                          controller: not,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: Tr.notes.tr,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  gapPadding: 4)),
                        ),
                      ],
                    ),
                  ),
                ));
              }));
        }
      },
      icon: const Icon(Icons.add_box_outlined, color: Colors.black),
      label: Text(
        Tr.addOrderInMap.tr,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
      ),
    );
  }
}
