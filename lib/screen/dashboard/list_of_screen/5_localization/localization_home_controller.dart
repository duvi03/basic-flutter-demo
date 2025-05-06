import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationHomeController extends GetxController {
  final localeList = [
    {'name': 'English', 'langCode': 'en', 'countryCode': 'US'},
    {'name': 'हिंदी', 'langCode': 'hi', 'countryCode': 'IN'},
    {'name': 'Español', 'langCode': 'es', 'countryCode': 'ES'},
    {'name': 'Français', 'langCode': 'fr', 'countryCode': 'FR'},
    {'name': 'ગુજરાતી', 'langCode': 'gu', 'countryCode': 'IN'},
  ];

  void updateLanguage(String langCode, String countryCode) {
    Get.updateLocale(Locale(langCode, countryCode));
  }
}
