import 'package:library_app/common/presentation/localization/data/prefs/global_localization_data_source.dart';
import 'package:library_app/di/di_locator.dart';

class GlobalLocalizationRepository {
  GlobalLocalizationRepository() : _dataSource = sl();
  final GlobalLocalizationDataSource _dataSource;

  Future<String> getLocale() => _dataSource.getLocale();

  void setLocale(String locale) => _dataSource.setLocale(locale);

  void removeLocale() => _dataSource.removeLocale();
}