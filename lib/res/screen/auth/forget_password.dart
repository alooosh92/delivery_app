import 'package:delivery_app/res/controller/auth_controller.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    final formForgetPasswordKey = GlobalKey<FormState>();
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
                  label: "البريد الإلكتروني",
                  type: TextInputType.emailAddress,
                  valida: (value) {
                    if (value == null || value.isEmpty) {
                      return "لا يمكن ترك هذه القيمة فارغة";
                    } else {
                      if (!value.contains("@") || !value.contains(".")) {
                        return "الرجاء ادخال ايميل صحيح";
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
                  child: const Text("اعادة تعيين كلمة السر")),
            ],
          ),
        ),
      ),
    );
  }
}
