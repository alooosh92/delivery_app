import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/user_info_controller.dart';
import '../../../database/user_info.dart';
import 'info_page_button.dart';
import 'input_form.dart';

class UserInfoBody extends StatelessWidget {
  const UserInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfoController userInfoController = Get.find();
    TextEditingController name = TextEditingController();
    TextEditingController mobile = TextEditingController();
    bool? sex;
    int? region;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<Userinfo?>(
          future: Userinfo.getUserInfo(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            name.text = snapShot.data?.name == null ? "" : snapShot.data!.name;
            mobile.text =
                snapShot.data?.mobile == null ? "" : snapShot.data!.mobile;
            sex = snapShot.data?.sex == null ? true : snapShot.data!.sex;
            region =
                snapShot.data?.region == null ? null : snapShot.data!.region;
            return Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputForm(
                    controller: name,
                    label: "الاسم الكامل",
                    type: TextInputType.text,
                  ),
                  InputForm(
                    controller: mobile,
                    label: "رقم المبايل",
                    type: TextInputType.phone,
                  ),
                  DropdownButtonFormField<bool>(
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
                  DropdownButtonFormField<int>(
                    value: region,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      label: Text("المحافظة"),
                    ),
                    items: userInfoController
                        .getRegionlist(snapShot.data!.lRegion),
                    onChanged: (value) {
                      region = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfopageButton(
                        buttonColore: null,
                        text: "حفظ",
                        textColor: null,
                        press: () {
                          userInfoController.clickSaveButton(
                            Userinfo(
                                id: "id",
                                name: name.text,
                                mobile: mobile.text,
                                sex: sex!,
                                region: region!,
                                point: 0),
                          );
                        },
                      ),
                      InfopageButton(
                        buttonColore: Colors.amber,
                        text: "إلغاء",
                        textColor: Colors.white,
                        press: () {
                          userInfoController.clickCanselButton();
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
