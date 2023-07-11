import 'package:delivery_app/res/controller/home_controller.dart';
import 'package:delivery_app/res/screen/home/widget/user_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrderScreen extends StatelessWidget {
  const UserOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return FutureBuilder(
          future: homeController.getUserOrder(),
          initialData: const [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    snapshot.data![index].confirmOrder == null
                        ? homeController.onOrderClick(snapshot.data![index].id)
                        : null;
                  },
                  child: UserOrderWidget(
                    id: snapshot.data![index].id,
                    accseptOrder: snapshot.data![index].accseptOrder,
                    code: snapshot.data![index].code,
                    confirmOrder: snapshot.data![index].confirmOrder,
                    createTime: snapshot.data![index].createTime,
                    delivery: snapshot.data![index].delivery,
                    deliveryTime: snapshot.data![index].deliveryTime,
                    listOrder: snapshot.data![index].listOrder,
                    shopname: snapshot.data![index].shopname,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
