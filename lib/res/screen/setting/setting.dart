import 'package:delivery_app/res/master_widget/localizations.dart';
import 'package:delivery_app/res/master_widget/tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingSecreen extends StatelessWidget {
  const SettingSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              LocalizationsManager.locale == const Locale("ar")
                  ? {
                      LocalizationsManager.setLangValue("en"),
                      Get.updateLocale(const Locale("en"))
                    }
                  : {
                      LocalizationsManager.setLangValue("ar"),
                      Get.updateLocale(const Locale("ar"))
                    };
            },
            child: Center(child: Text(Tr.lang.tr))),
      ),
    );
  }
}
