import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../database/user_order.dart';
import '../../../master_widget/color.dart';

class UserOrderWidget extends StatelessWidget {
  const UserOrderWidget({
    super.key,
    required this.id,
    required this.shopname,
    required this.listOrder,
    required this.delivery,
    required this.createTime,
    required this.confirmOrder,
    required this.accseptOrder,
    required this.deliveryTime,
    required this.code,
  });
  final String id;
  final String shopname;
  final List<TabelRowItem> listOrder;
  final int delivery;
  final DateTime createTime;
  final DateTime? confirmOrder;
  final DateTime? accseptOrder;
  final DateTime? deliveryTime;
  final int code;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        margin: const EdgeInsets.only(bottom: 10, top: 10, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ColorManager.appbarcolor),
            color: Colors.blue[50],
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: ColorManager.appbarcolor,
                offset: Offset.zero,
                spreadRadius: 2,
              )
            ]),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ColorManager.appbarcolor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        shopname,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.textWhite),
                      ),
                    ),
                    Visibility(
                        visible: confirmOrder == null,
                        child: InkWell(
                          onTap: () {
                            Get.dialog(AlertDialog(
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      await UserOrder.deleteOrder(id);
                                      Get.back();
                                    },
                                    child: const Text("تاكيد")),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("إلغاء"))
                              ],
                              title: const Text("حذف الطلبية"),
                              content:
                                  const Text("هل أنت متأكد من حذف الطلبية"),
                            ));
                          },
                          child: const Icon(Icons.delete),
                        )),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const {
                            0: FixedColumnWidth(120),
                            1: FixedColumnWidth(40),
                            2: FixedColumnWidth(50),
                          },
                          children: homeController.getOrderListItem(listOrder)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      child: Table(
                        border: TableBorder.all(),
                        columnWidths: const {
                          0: FixedColumnWidth(120),
                          1: FixedColumnWidth(90),
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(
                                height: 20,
                                color: Colors.black38,
                                child: const Center(
                                  child: Text(
                                    "اجمالي الفاتورة",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                                color: Colors.black38,
                                child: Center(
                                  child: Text(
                                    homeController
                                        .getOrderListPrice(listOrder)
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 20,
                                color: Colors.black38,
                                child: const Center(
                                  child: Text(
                                    "أجور التوصيل",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                                color: Colors.black38,
                                child: Center(
                                  child: Text(
                                    delivery.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 20,
                                color: ColorManager.appbarcolor,
                                child: const Center(
                                  child: Text(
                                    "المجموع",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                                color: ColorManager.appbarcolor,
                                child: Center(
                                  child: Text(
                                    (homeController
                                                .getOrderListPrice(listOrder) +
                                            delivery)
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text("التفاصيل"),
                    Text("التاريخ: ${createTime.toString().substring(0, 10)}"),
                    Text(
                        "وقت التقديم: ${createTime.toString().substring(11, 17)}"),
                    Text(
                        "وقت التثبيت: ${confirmOrder == null ? "لا يوجد" : confirmOrder.toString().substring(11, 17)}"),
                    Text(
                        "وقت القبول: ${accseptOrder == null ? "لا يوجد" : accseptOrder.toString().substring(11, 17)}"),
                    Text(
                        "وقت التسليم: ${deliveryTime == null ? "لا يوجد" : deliveryTime.toString().substring(11, 17)}"),
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: 3, right: 5, left: 5, top: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorManager.appbarcolor),
                      child: Text(
                        'كود الاستلام: $code',
                        style: const TextStyle(
                            color: ColorManager.textWhite,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
