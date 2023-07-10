import 'package:delivery_app/res/master_widget/localizations.dart';
import 'package:delivery_app/res/master_widget/services.dart';
import 'package:delivery_app/res/screen/auth/widget/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  LocalizationsManager.getLangValue();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: LocalizationsManager.locale,
      defaultTransition: LocalizationsManager.defaultTransition,
      fallbackLocale: LocalizationsManager.fallbackLocale,
      localizationsDelegates: LocalizationsManager.localizationsDelegates,
      supportedLocales: LocalizationsManager.supportedLocales,
      translations: LocalizationsManager.translations,
      initialBinding: Services(),
      home: const AuthWidget(),
    );
  }
}
