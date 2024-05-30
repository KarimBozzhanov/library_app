part of 'global_localization_cubit.dart';

class GlobalLocalizationCommonState extends Equatable {
  const GlobalLocalizationCommonState({
    this.locale = AppLocale.ruKey,
  });

  final String locale;

  @override
  List<Object?> get props => [locale];
}
