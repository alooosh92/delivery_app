import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/bay_item.dart';
import '../../../master_widget/show_dialog_def.dart';

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
            title: const Text("إضافة طلب شراء"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: num,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "العدد",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 4)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: not,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "ملاحظات الطلب",
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
                        masseg: "الرجاء تحديد موقع التوصيل",
                        title: "تحذير",
                        okText: "موافق",
                        ok: () {
                          Get.back();
                        });
                  }
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
                        masseg:
                            "تمت اضافة الطلبية بنجاح\nملاحظة: يجب تثبيت الطلبية بعد الانتهاء",
                        title: "ملاحظات",
                        okText: "موافق",
                        ok: () {
                          Get.back();
                        });
                  }
                },
                child: const Text(
                  "شراء",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("إلغاء"),
              )
            ],
          ),
        );
      },
      child: const Text("إضافة الى السلة"),
    );
  }
}
