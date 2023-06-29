import 'package:delivery_app/res/database/auth.dart';
import 'package:delivery_app/res/screen/auth/login.dart';
import 'package:delivery_app/res/screen/home/home.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AuthServies.userIslogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!) {
            return const MasterScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
