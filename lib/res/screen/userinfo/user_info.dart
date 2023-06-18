import 'package:delivery_app/res/screen/userinfo/widget/input_form.dart';
import 'package:delivery_app/res/screen/userinfo/widget/user_info_body.dart';
import 'package:flutter/material.dart';
import '../../master_widget/app_bar.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefult(),
      body: const UserInfoBody(),
    );
  }
}
