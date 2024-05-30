import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_app/common/presentation/localization/domain/use_case/global_localization_use_case.dart';
import 'package:library_app/config/locale.dart';
import 'package:library_app/di/di_locator.dart';

part 'global_localization_state.dart';

class GlobalLocalizationCubit extends Cubit<GlobalLocalizationCommonState> {
  GlobalLocalizationCubit()
      : _getLocalizationUseCase = sl(),
        _setLocalizationUseCase = sl(),
        _removeLocalizationUseCase = sl(),
        super(const GlobalLocalizationCommonState());

  final GlobalGetLocalizationUseCase _getLocalizationUseCase;
  final GlobalSetLocalizationUseCase _setLocalizationUseCase;
  final GlobalRemoveLocalizationUseCase _removeLocalizationUseCase;

  Future<void> getLocale() async {
    final locale = await _getLocalizationUseCase.execute();
    emit(
      GlobalLocalizationCommonState(locale: locale),
    );
  }

  void setLocale(String locale) {
    _setLocalizationUseCase.execute(locale);
    emit(
      GlobalLocalizationCommonState(locale: locale),
    );
  }

  Future<void> removeLocale() async {
    _removeLocalizationUseCase.execute();
    final locale = await _getLocalizationUseCase.execute();
    emit(
      GlobalLocalizationCommonState(locale: locale),
    );
  }
}
