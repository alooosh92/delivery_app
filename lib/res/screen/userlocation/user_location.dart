import 'package:delivery_app/res/master_widget/app_bar.dart';
import 'package:delivery_app/res/screen/userlocation/widget/user_location_body.dart';
import 'package:flutter/material.dart';

class UserLocationScreen extends StatelessWidget {
  const UserLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefult(),
      body: const UserLocationBody(),
    );
  }
}
