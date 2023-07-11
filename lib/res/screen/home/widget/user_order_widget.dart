import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
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
                                      Get.dialog(const Center(
                                        child: CircularProgressIndicator(),
                                      ));
                                      await UserOrder.deleteOrder(id);
                                      homeController.update();
                                      Get.back();
                                      Get.back();
                                    },
                                    child: Text(Tr.ok.tr)),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(Tr.cancel.tr))
                              ],
                              title: Text(Tr.deleteOrder.tr),
                              content: Text(Tr.deleteOrderQ.tr),
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
                                child: Center(
                                  child: Text(
                                    Tr.total.tr,
                                    style: const TextStyle(
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
                                child: Center(
                                  child: Text(
                                    Tr.deliveryPrice.tr,
                                    style: const TextStyle(
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
                                child: Center(
                                  child: Text(
                                    Tr.total.tr,
                                    style: const TextStyle(
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
                    Text(Tr.information.tr),
                    Text(
                        "${Tr.date.tr} ${createTime.toString().substring(0, 10)}"),
                    Text(
                        "${Tr.createTime.tr} ${createTime.toString().substring(11, 17)}"),
                    Text(
                        "${Tr.confirmTime.tr} ${confirmOrder == null ? Tr.notSet.tr : confirmOrder.toString().substring(11, 17)}"),
                    Text(
                        "${Tr.acceptanceTime.tr} ${accseptOrder == null ? Tr.notSet.tr : accseptOrder.toString().substring(11, 17)}"),
                    Text(
                        "${Tr.delivryTime.tr} ${deliveryTime == null ? Tr.notSet.tr : deliveryTime.toString().substring(11, 17)}"),
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: 3, right: 5, left: 5, top: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorManager.appbarcolor),
                      child: Text(
                        '${Tr.pinCode.tr} $code',
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
