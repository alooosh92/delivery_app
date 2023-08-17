import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../database/bay_item.dart';
import '../../../master_widget/show_dialog_def.dart';
import '../../../master_widget/tr.dart';

class BayButton extends StatelessWidget {
  const BayButton({
    super.key,
    required this.id,
    required this.price,
  });

  final String id;
  final double price;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        TextEditingController num = TextEditingController();
        TextEditingController not = TextEditingController();
        Get.dialog(
          AlertDialog(
            title: Text(Tr.addBasket.tr),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: num,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: Tr.number.tr,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 4)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: not,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: Tr.notes.tr,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 4)),
                ),
                const SizedBox(height: 20),
              ],
            ),
            actions: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                ),
                onPressed: () async {
                  HomeController ac = Get.find();
                  if (ac.userlocationId == null) {
                    Get.back();
                    return showDialogDef(
                        masseg: Tr.selectLocation.tr,
                        title: Tr.warning.tr,
                        okText: Tr.ok.tr,
                        ok: () {
                          Get.back();
                        });
                  }
                  Get.back();
                  Get.dialog(const Center(
                    child: CircularProgressIndicator(),
                  ));
                  var item = BayItem(
                      item: id,
                      numberOfItem: int.parse(num.text),
                      notes: not.text,
                      locationId: ac.userlocationId!,
                      price: price);
                  var b = await BayItem.bayItem(item);
                  Get.back();
                  if (b) {
                    return showDialogDef(
                        masseg: Tr.addOrderSuccessfully.tr,
                        title: Tr.notes.tr,
                        okText: Tr.ok.tr,
                        ok: () {
                          Get.back();
                        });
                  }
                },
                child: Text(
                  Tr.bay.tr,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(Tr.cancel.tr),
              )
            ],
          ),
        );
      },
      child: Text(Tr.addToBasket.tr),
    );
  }
}