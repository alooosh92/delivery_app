import 'package:delivery_app/res/screen/home/widget/user_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../database/user_order.dart';

class UserOrderScreen extends StatelessWidget {
  const UserOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserOrder>>(
        initialData: List.empty(),
        future: UserOrder.getUserOrder(),
        builder: (context, snapshot) {
          List<Widget> listOrder = [];
          for (var element in snapshot.data!) {
            var o = InkWell(
              onTap: () {
                if (element.confirmOrder == null) {
                  Get.dialog(AlertDialog(
                    actions: [
                      ElevatedButton(
                          onPressed: () async {
                            await UserOrder.doneOrder(element.id);
                          },
                          child: const Text("تاكيد")),
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("إلغاء"))
                    ],
                    title: const Text("تأكيد الطلبية"),
                    content: const Text(
                        "هل أنت متأكد من تثبيت الطلبية\nملاحظة: بعد تأكيد الطلبية لا يمكن إلغائها أو تعديلها"),
                  ));
                }
              },
              child: UserOrderWidget(
                id: element.id,
                accseptOrder: element.accseptOrder,
                code: element.code,
                confirmOrder: element.confirmOrder,
                createTime: element.createTime,
                delivery: element.delivery,
                deliveryTime: element.deliveryTime,
                listOrder: element.listOrder,
                shopname: element.shopname,
              ),
            );
            listOrder.add(o);
          }
          return SingleChildScrollView(
            child: Column(
              children: listOrder,
            ),
          );
        });
  }
}
