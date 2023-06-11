import 'package:delivery_app/res/master/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../master/app_bar.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController mobile = TextEditingController();
    // ignore: unused_local_variable
    bool? sex;
    // ignore: unused_local_variable
    int? region;
    List<DropdownMenuItem<int>> listRegion = [];
    return Scaffold(
      appBar: appBarDefult(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<Userinfo?>(
            future: Userinfo.getUserInfo(),
            builder: (context, snapShot) {
              if (!snapShot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              name.text = snapShot.data!.name;
              mobile.text = snapShot.data!.mobile;
              sex = snapShot.data!.sex;
              region = snapShot.data!.region;
              listRegion.clear();
              for (var element in snapShot.data!.lRegion) {
                var d = DropdownMenuItem<int>(
                  value: element.id,
                  child: Text(element.regionName),
                );
                listRegion.add(d);
              }
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
                      items: listRegion,
                      onChanged: (value) {
                        region = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(
                                Size(MediaQuery.of(context).size.width * 0.4,
                                    20),
                              ),
                            ),
                            onPressed: () async {
                              var b = await Userinfo.updateUserInfo(Userinfo(
                                id: "id",
                                name: name.text,
                                mobile: mobile.text,
                                sex: sex!,
                                region: region!,
                              ));
                              if (b) {
                                Get.defaultDialog(
                                    title: "معلومات",
                                    content:
                                        const Text("تمت تعديل المعلومات بنجاح"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("موافق"))
                                    ]);
                              }
                            },
                            child: const Text("حفظ")),
                        ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(
                                Size(MediaQuery.of(context).size.width * 0.4,
                                    20),
                              ),
                              backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 238, 194, 64),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "تغيير كلمة السر",
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.label,
    required this.type,
    required this.controller,
  });
  final String label;
  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          label: Text(label)),
    );
  }
}
