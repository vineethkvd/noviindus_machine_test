import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noviindus_machine_test/res/getx_localization/language.dart';
import 'package:noviindus_machine_test/res/routes/routes.dart';
import 'package:noviindus_machine_test/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Language(), // Add translations
      locale: Locale('en', 'US'), // Set initial locale (optional)
      fallbackLocale: Locale('en', 'US'), // Set fallback locale (optional)
      getPages: AppRoute.appRoute(),
    );
  }
}
