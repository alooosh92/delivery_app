import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_location_controller.dart';
import '../../../database/user_location.dart';
import 'location_card.dart';

class UserLocationBody extends StatelessWidget {
  const UserLocationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserLocationContoller>(
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
        });
  }
}
