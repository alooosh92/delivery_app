import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/appbar_controller.dart';
import '../../../database/bay_item.dart';
import '../../../database/item_info.dart';
import '../../../master_widget/show_dialog_def.dart';
import '../../home/widget/search.dart';

class ItemBody extends StatelessWidget {
  const ItemBody({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemInfo?>(
      initialData: null,
      future: ItemInfo.getItemInfo(id),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          snapshot.data!.image,
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 100,
                            height: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "lib/assest/images/price2.png")),
                            ),
                            child: Center(
                                child: Text(
                              snapshot.data!.price.toInt().toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "التقيم",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              ElevWidget(
                                elev: snapshot.data!.evaluation,
                                size: 20,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.info,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      TextEditingController num = TextEditingController();
                      TextEditingController not = TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gapPadding: 4)),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: not,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "ملاحظات الطلب",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gapPadding: 4)),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.greenAccent),
                                ),
                                onPressed: () async {
                                  AppbarController ac = Get.find();
                                  if (ac.local == null) {
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
                                      locationId: ac.local!,
                                      price: snapshot.data!.price);
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
                          );
                        },
                      );
                    },
                    child: const Text("إضافة الى السلة"))
              ],
            ),
          ),
        );
      },
    );
  }
}
