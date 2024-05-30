import 'package:library_app/common/constant/global_pref_constant.dart';
import 'package:library_app/utils/localization_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalLocalizationDataSource {
  GlobalLocalizationDataSource(this.sharedPreferences);
  final Future<SharedPreferences> sharedPreferences;

  Future<String> getLocale() async {
    final prefs = await sharedPreferences;
    final locale = prefs.getString(GlobalPrefConstant.prefSelectedLocale);
    return locale ?? defaultLocale();
  }

  Future<void> setLocale(String locale) async {
    final prefs = await sharedPreferences;
    await prefs.setString(GlobalPrefConstant.prefSelectedLocale, locale);
  }

  Future<void> removeLocale() async {
    final prefs = await sharedPreferences;
    await prefs.remove(GlobalPrefConstant.prefSelectedLocale);
  }
}