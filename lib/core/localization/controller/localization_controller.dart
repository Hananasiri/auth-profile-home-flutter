import 'package:auth_profile_home_flutter/core/constants/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';


class LocalizationController {
  GetStorage localeStorage = GetStorage();
  var items = [
    'English',
    'Arabic',
  ];
  String selected =
  GetStorage().read(AppKeys.langKey) == 'ar' ? "Arabic" : "English";

  void setSelected(String? value) {
    selected = value!;
  }

  Locale initialLang =
  GetStorage().read('lang') == 'ar' ? const Locale('ar') : const Locale('en');

  void changeLanguage(String codeLanguage) async {
    Locale locale = Locale(codeLanguage);
    initialLang = Locale(codeLanguage);
    await localeStorage.write(AppKeys.langKey, codeLanguage);
    Get.updateLocale(locale);
    // update();
  }
}
