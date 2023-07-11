import 'package:delivery_app/res/database/region.dart';
import 'package:delivery_app/res/screen/auth/login.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../master_widget/tr.dart';

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
    GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();
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
                  ),
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
                  AuthTextFormField(
                    controller: passwordConform,
                    hide: true,
                    icon: Icons.password,
                    label: Tr.confirmPassword.tr,
                    type: TextInputType.visiblePassword,
                    valida: (value) {
                      if (value == null || value.isEmpty) {
                        return Tr.plaseInsertPassword.tr;
                      } else {
                        if (value != password.text) {
                          return Tr.passwordIsNotMatch.tr;
                        }
                      }
                      return null;
                    },
                  ),
                  AuthTextFormField(
                    controller: name,
                    hide: false,
                    icon: Icons.abc,
                    label: Tr.fullName.tr,
                    type: TextInputType.visiblePassword,
                    valida: (value) {
                      if (value == null || value.isEmpty) {
                        return Tr.notEmpty.tr;
                      }
                      return null;
                    },
                  ),
                  AuthTextFormField(
                    controller: mobile,
                    hide: false,
                    icon: Icons.phone_android,
                    label: Tr.mobail.tr,
                    type: TextInputType.visiblePassword,
                    valida: (value) {
                      if (value == null || value.isEmpty) {
                        return Tr.notEmpty.tr;
                      } else {
                        if (value.length < 10) {
                          return Tr.shortMobail.tr;
                        }
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<bool>(
                    validator: (value) {
                      if (value == null) {
                        return Tr.notEmpty.tr;
                      }
                      return null;
                    },
                    value: sex,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        label: Text(Tr.sex.tr)),
                    items: [
                      DropdownMenuItem(
                        value: true,
                        child: Text(Tr.man.tr),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text(Tr.wman.tr),
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
                            return Tr.notEmpty.tr;
                          }
                          return null;
                        },
                        value: region,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          label: Text(Tr.region.tr),
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
                              SnackBar(
                                content: Center(child: Text(Tr.emailIsUsed.tr)),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(Tr.register.tr)),
                  TextButton(
                      onPressed: () {
                        Get.offAll(const LoginScreen());
                      },
                      child: Text(Tr.youHaveAccont.tr)),
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
