import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.94,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .15,
                  ),
                  AuthTextFormField(
                      controller: oldPassword,
                      label: "كلمة السر القديمة",
                      type: TextInputType.emailAddress,
                      valida: (value) {
                        if (value == null || value.isEmpty) {
                          return "لا يمكن ترك هذه القيمة فارغة";
                        }
                        return null;
                      },
                      hide: true,
                      icon: Icons.password),
                  AuthTextFormField(
                      controller: newPassword,
                      label: "كلمة السر الجديدة",
                      type: TextInputType.emailAddress,
                      valida: (value) {
                        if (value == null || value.isEmpty) {
                          return "لا يمكن ترك هذه القيمة فارغة";
                        } else {
                          if (value.length < 6) {
                            return "كلمة السر قصيرة";
                          }
                        }
                        return null;
                      },
                      hide: true,
                      icon: Icons.password),
                  AuthTextFormField(
                      controller: confirmPassword,
                      label: "تأكيد كلمة السر",
                      type: TextInputType.emailAddress,
                      valida: (value) {
                        if (value == null || value.isEmpty) {
                          return "لا يمكن ترك هذه القيمة فارغة";
                        } else {
                          if (value != newPassword.text) {
                            return "كلمة السر غير مطابقة";
                          }
                        }
                        return null;
                      },
                      hide: true,
                      icon: Icons.password),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          Get.dialog(
                              const Center(child: CircularProgressIndicator()));
                          var b = await AuthController.changePassword(
                              oldPassword.text, newPassword.text);
                          if (b) {
                            //  Get.offAll(const LoginScreen());
                          }
                        }
                      },
                      child: const Text("اعادة تعيين كلمة السر")),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
