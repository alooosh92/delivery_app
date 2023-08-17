import 'package:delivery_app/res/database/auth.dart';
import 'package:delivery_app/res/master_widget/show_dialog_def.dart';
import 'package:delivery_app/res/screen/auth/login.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../master_widget/tr.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formChangePasswordKey = GlobalKey<FormState>();
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
              key: formChangePasswordKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .15,
                  ),
                  AuthTextFormField(
                      controller: oldPassword,
                      label: Tr.oldPassword.tr,
                      type: TextInputType.emailAddress,
                      valida: (value) {
                        if (value == null || value.isEmpty) {
                          return Tr.plaseInsertPassword.tr;
                        }
                        return null;
                      },
                      hide: true,
                      icon: Icons.password),
                  AuthTextFormField(
                      controller: newPassword,
                      label: Tr.newPassword.tr,
                      type: TextInputType.emailAddress,
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
                      hide: true,
                      icon: Icons.password),
                  AuthTextFormField(
                      controller: confirmPassword,
                      label: Tr.confirmPassword.tr,
                      type: TextInputType.emailAddress,
                      valida: (value) {
                        if (value == null || value.isEmpty) {
                          return Tr.plaseInsertPassword.tr;
                        } else {
                          if (value != newPassword.text) {
                            return Tr.passwordIsNotMatch.tr;
                          }
                        }
                        return null;
                      },
                      hide: true,
                      icon: Icons.password),
                  ElevatedButton(
                      onPressed: () async {
                        if (formChangePasswordKey.currentState!.validate()) {
                          Get.dialog(
                              const Center(child: CircularProgressIndicator()));
                          var b = await AuthController.changePassword(
                              oldPassword.text, newPassword.text);
                          if (b) {
                            Get.back();
                            showDialogDef(
                                ok: () async {
                                  await AuthServies.logout();
                                  Get.offAll(const LoginScreen());
                                },
                                okText: Tr.ok.tr,
                                title: Tr.notes.tr,
                                masseg: Tr.editPasswordSccuss.tr);
                          }
                        }
                      },
                      child: Text(Tr.changePassword.tr)),
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
