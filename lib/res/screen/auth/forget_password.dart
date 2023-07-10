import 'package:delivery_app/res/controller/auth_controller.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../master_widget/tr.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> formForgetPasswordKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formForgetPasswordKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthTextFormField(
                  controller: email,
                  label: Tr.emailAdrees.tr,
                  type: TextInputType.emailAddress,
                  valida: (value) {
                    if (value == null || value.isEmpty) {
                      return Tr.plaseInsertEmailAdress.tr;
                    } else {
                      if (!value.contains("@") || !value.contains(".")) {
                        return Tr.currectEmail.tr;
                      }
                    }
                    return null;
                  },
                  hide: false,
                  icon: Icons.email),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formForgetPasswordKey.currentState!.validate()) {
                      Get.dialog(
                          const Center(child: CircularProgressIndicator()));
                      await AuthController.forgetPassword(email.text);
                    }
                  },
                  child: Text(Tr.changePassword.tr)),
            ],
          ),
        ),
      ),
    );
  }
}
