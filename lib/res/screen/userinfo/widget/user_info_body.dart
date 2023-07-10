import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/user_info_controller.dart';
import '../../../database/user_info.dart';
import '../../../master_widget/tr.dart';
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
            List<DropdownMenuItem<int>> regions = [];
            for (var element in snapShot.data!.lRegion) {
              regions.add(DropdownMenuItem(
                  value: element.id, child: Text(element.regionName)));
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
                    label: Tr.fullName.tr,
                    type: TextInputType.text,
                  ),
                  InputForm(
                    controller: mobile,
                    label: Tr.mobail.tr,
                    type: TextInputType.phone,
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
                  DropdownButtonFormField<int>(
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
                    items: regions,
                    onChanged: (value) {
                      region = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfopageButton(
                        buttonColore: null,
                        text: Tr.save.tr,
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
                        text: Tr.cancel.tr,
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
