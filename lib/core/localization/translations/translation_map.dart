import 'package:auth_profile_home_flutter/core/localization/language/ar.dart';
import 'package:auth_profile_home_flutter/core/localization/language/en.dart';
import 'package:get/get.dart';

class TranslationsMap implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
  };
}