import 'package:delivery_app/res/controller/auth_controller.dart';
import 'package:delivery_app/res/screen/auth/register.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: MediaQuery.sizeOf(context).height / 4,
                  child: const CircleAvatar(
                    maxRadius: double.infinity,
                  )),
              AuthTextFormField(
                controller: username,
                hide: false,
                icon: Icons.email,
                label: "البريد الالكتروني",
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
              ),
              AuthTextFormField(
                controller: password,
                hide: true,
                icon: Icons.password,
                label: "كلمة السر",
                type: TextInputType.visiblePassword,
                valida: (value) {
                  if (value == null || value.isEmpty) {
                    return "لا يمكن ترك هذه القيمة فارغة";
                  } else {
                    if (value.length < 6) {
                      return "كلمة المرور أقصر من اللازم";
                    }
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var b = await AuthController.login(
                          username.text, password.text);
                      if (!b) {
                        // ignore: use_build_context_synchronously
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                                child:
                                    Text("اسم المستخدم او كلمة المرور خاطئة")),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("تسجيل الدخول")),
              TextButton(
                  onPressed: () {
                    Get.to(const RegisterScreen());
                  },
                  child: const Text("هل تملك حساب؟ سجل من هنا مجاناً")),
              const Center(
                child: Text("جميع الحقوق محفوطة لشركة تيكنو"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
