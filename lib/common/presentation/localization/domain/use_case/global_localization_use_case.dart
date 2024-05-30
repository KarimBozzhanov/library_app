import 'package:library_app/common/presentation/localization/data/repository/global_localization_repository.dart';
import 'package:library_app/di/di_locator.dart';

class GlobalGetLocalizationUseCase {
  GlobalGetLocalizationUseCase() : _repository = sl();
  final GlobalLocalizationRepository _repository;

  Future<String> execute() async {
    final locale = await _repository.getLocale();
    return locale;
  }
}

class GlobalSetLocalizationUseCase {
  GlobalSetLocalizationUseCase() : _repository = sl();

  final GlobalLocalizationRepository _repository;

  void execute(String param) {
    return _repository.setLocale(param);
  }
}

class GlobalRemoveLocalizationUseCase {
  GlobalRemoveLocalizationUseCase() : _repository = sl();

  final GlobalLocalizationRepository _repository;

  void execute() {
    return _repository.removeLocale();
  }
}