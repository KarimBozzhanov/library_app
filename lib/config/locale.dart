import 'dart:ui';

import 'package:library_app/common/constant/core_constant.dart';

class AppLocale {
  static const ruKey = 'ru';
  static const kzKey = 'kk';
  static const enKey = 'en';

  static const ru = Locale(ruKey, CoreConstant.empty);
  static const kz = Locale(kzKey, CoreConstant.empty);
  static const en = Locale(enKey, CoreConstant.empty);

  static const supportedLocales = [ru, kz, en];
}