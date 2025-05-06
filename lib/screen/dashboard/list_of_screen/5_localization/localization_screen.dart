import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/5_localization/local_string.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/5_localization/localization_home_binding.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/5_localization/localization_home_page.dart';
import 'package:get/get.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      title: 'Flutter Localization Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocalizationHomePage(),
      initialBinding: LocalizationHomeBinding(),
    );
  }
}