import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/5_localization/localization_home_controller.dart';
import 'package:get/get.dart';

class LocalizationHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalizationHomeController());
  }
}