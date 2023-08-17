import 'package:delivery_app/res/controller/auth_controller.dart';
import 'package:delivery_app/res/screen/auth/forget_password.dart';
import 'package:delivery_app/res/screen/auth/register.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../master_widget/tr.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.94,
            child: Form(
              key: formLoginKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height / 4,
                      child: const CircleAvatar(
                        maxRadius: double.infinity,
                      )),
                  SizedBox(
                    child: Column(
                      children: [
                        AuthTextFormField(
                          controller: username,
                          hide: false,
                          icon: Icons.email,
                          label: Tr.emailAdrees.tr,
                          type: TextInputType.emailAddress,
                          valida: (value) {
                            if (value == null || value.isEmpty) {
                              return Tr.plaseInsertEmailAdress.tr;
                            } else {
                              if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return Tr.currectEmail.tr;
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthTextFormField(
                          controller: password,
                          hide: true,
                          icon: Icons.password,
                          label: Tr.password.tr,
                          type: TextInputType.visiblePassword,
                          valida: (value) {
                            if (value == null || value.isEmpty) {
                              return Tr.plaseInsertPassword.tr;
                            } else {
                              if (value.length < 6) {
                                return Tr.palseInsert6LaterAtLess.tr;
                              }
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.to(const ForgetPasswordScreen());
                                },
                                child: Text(Tr.forgetPassword.tr))
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formLoginKey.currentState!.validate()) {
                          Get.dialog(const Center(
                            child: CircularProgressIndicator(),
                          ));

                          var b = await AuthController.login(
                              username.text, password.text);
                          if (!b) {
                            // ignore: use_build_context_synchronously
                            if (!context.mounted) return;
                            Get.back();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(
                                    child: Text(Tr.wrongEmailAngPassword.tr)),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(Tr.login.tr)),
                  TextButton(
                      onPressed: () {
                        Get.to(const RegisterScreen());
                      },
                      child: Text(Tr.youDoNotHaveAnAccont.tr)),
                  Center(
                    child: Text(Tr.allRieghtReserved.tr),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
