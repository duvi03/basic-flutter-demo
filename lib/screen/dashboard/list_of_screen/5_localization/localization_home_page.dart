import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/5_localization/localization_home_controller.dart';
import 'package:get/get.dart';

class LocalizationHomePage extends GetView<LocalizationHomeController> {
  const LocalizationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: GetBuilder(
              init: LocalizationHomeController(),
              builder: (controller) {
                return DropdownButton(
                  hint: Text('change_lang'.tr),
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      final selectedLang = controller.localeList
                          .firstWhere((locale) => locale['name'] == newValue);
                      controller.updateLanguage(selectedLang['langCode']!,
                          selectedLang['countryCode']!);
                    }
                  },
                  items: controller.localeList
                      .map<DropdownMenuItem<String>>((locale) {
                    return DropdownMenuItem(
                      value: locale['name'],
                      child: Text(locale['name']!),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('hello'.tr, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 10),
              Text('message'.tr, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text('flutter_description'.tr,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('subscribe'.tr, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
