import 'package:delivery_app/res/database/region.dart';
import 'package:delivery_app/res/screen/auth/login.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController passwordConform = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController mobile = TextEditingController();
    bool? sex;
    int? region;
    final formRegisterKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.93,
            child: Form(
              key: formRegisterKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  AuthTextFormField(
                    controller: passwordConform,
                    hide: true,
                    icon: Icons.password,
                    label: "تأكيد كلمة السر",
                    type: TextInputType.visiblePassword,
                    valida: (value) {
                      if (value == null || value.isEmpty) {
                        return "لا يمكن ترك هذه القيمة فارغة";
                      } else {
                        if (value != password.text) {
                          return "كلمة المرور غير مطابقة ";
                        }
                      }
                      return null;
                    },
                  ),
                  AuthTextFormField(
                    controller: name,
                    hide: false,
                    icon: Icons.abc,
                    label: "الاسم الثلاثي",
                    type: TextInputType.visiblePassword,
                    valida: (value) {
                      if (value == null || value.isEmpty) {
                        return "لا يمكن ترك هذه القيمة فارغة";
                      }
                      return null;
                    },
                  ),
                  AuthTextFormField(
                    controller: mobile,
                    hide: false,
                    icon: Icons.phone_android,
                    label: "رقم المبايل",
                    type: TextInputType.visiblePassword,
                    valida: (value) {
                      if (value == null || value.isEmpty) {
                        return "لا يمكن ترك هذه القيمة فارغة";
                      } else {
                        if (value.length < 10) {
                          return "رقم الجوال أقصر من اللازم";
                        }
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<bool>(
                    validator: (value) {
                      if (value == null) {
                        return "لا يمكن ترك هذا الخيار فارغ";
                      }
                      return null;
                    },
                    value: sex,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        label: Text("الجنس")),
                    items: const [
                      DropdownMenuItem(
                        value: true,
                        child: Text("رجل"),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text("امرة"),
                      )
                    ],
                    onChanged: (value) {
                      sex = value;
                    },
                  ),
                  FutureBuilder<List<Region>>(
                    initialData: const [],
                    future: Region.getRegion(),
                    builder: (context, snapshot) {
                      List<DropdownMenuItem<int>> lRegion = [];
                      for (var element in snapshot.data!) {
                        lRegion.add(
                          DropdownMenuItem<int>(
                            value: element.id,
                            child: Text(element.regionName),
                          ),
                        );
                      }
                      return DropdownButtonFormField<int>(
                        validator: (value) {
                          if (value == null) {
                            return "لا يمكن ترك هذا الخيار فارغ";
                          }
                          return null;
                        },
                        value: region,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          label: Text("المحافظة"),
                        ),
                        items: lRegion,
                        onChanged: (value) {
                          region = value;
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formRegisterKey.currentState!.validate()) {
                          Get.dialog(const Center(
                            child: CircularProgressIndicator(),
                          ));
                          var b = await AuthController.register(
                              username.text,
                              password.text,
                              name.text,
                              mobile.text,
                              sex,
                              region);
                          if (!b) {
                            // ignore: use_build_context_synchronously
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                    child: Text(
                                        "البريد الالكتروني مستخدم مسبقاً")),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("إنشاء حساب جديد")),
                  TextButton(
                      onPressed: () {
                        Get.offAll(const LoginScreen());
                      },
                      child:
                          const Text("هل تملك حساب بالفعل؟ سجل الدخول من هنا")),
                  const Center(
                    child: Text("جميع الحقوق محفوطة لشركة تيكنو"),
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
