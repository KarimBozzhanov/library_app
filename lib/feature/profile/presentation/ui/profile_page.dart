import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/h_box.dart';
import 'package:library_app/common/presentation/localization/presentation/cubit/global_localization_cubit.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/common/presentation/w_box.dart';
import 'package:library_app/config/locale.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';
import 'package:library_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:library_app/generated/l10n.dart';

class ProfileBuilder extends StatelessWidget {
  const ProfileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProfileCubit()
        ..getCurrentUser(),
      child: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ProfileCubit, CoreState>(
          builder: (context, state) {
            if (state is ProfileSuccessState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Text(
                      S.of(context).account,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    AppImages.icAvatar,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: const EdgeInsets.only(bottom: 25, top: 26),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            state.user.name,
                            style: const TextStyle(
                              color: AppColors.rdBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: const EdgeInsets.only(bottom: 25),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            state.user.login,
                            style: const TextStyle(
                              color: AppColors.rdBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: const EdgeInsets.only(bottom: 25),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            state.user.phoneNumber,
                            style: const TextStyle(
                              color: AppColors.rdBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    margin: const EdgeInsets.only(bottom: 32),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            state.user.group,
                            style: const TextStyle(
                              color: AppColors.rdBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      BlocBuilder<GlobalLocalizationCubit,
                          GlobalLocalizationCommonState>(
                        builder: (context, state) {
                          return Expanded(
                            child: AppRoundedContainer(
                              onTap: () => showSelectLanguageModal(context),
                              backgroundColor: AppColors.rdBlack,
                              borderRadius: 8,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                state.locale.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.mainBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const WBox(12),
                      Expanded(
                        child: AppRoundedContainer(
                          onTap: () => context.read<GlobalAuthCubit>().logOut(),
                          borderColor: AppColors.rdBlack,
                          borderRadius: 8,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            S.of(context).logOut,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.rdBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  void showSelectLanguageModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final languages = LocaleItemEntity.localeItems(context);
        return BlocBuilder<GlobalLocalizationCubit,
            GlobalLocalizationCommonState>(
          builder: (context, state) {
            return Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(top: 8, bottom: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            S.of(context).appLanguage,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.rdBlack),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.rdBlack,
                          ),
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 40, top: 16),
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        return AppRoundedContainer(
                          borderRadius: 8,
                          backgroundColor: AppColors.rdBlack,
                          onTap: () {
                            context
                                .read<GlobalLocalizationCubit>()
                                .setLocale(languages[index].locale);
                            Navigator.pop(context);
                          },
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    languages[index].title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.mainBackground,
                                    ),
                                  ),
                                  const HBox(
                                    4,
                                  ),
                                  Text(
                                    languages[index].subtitle,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.mainBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                      const HBox(8),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// Класс для представления элемента локализации
class LocaleItemEntity {
  LocaleItemEntity({
    required this.title,
    required this.subtitle,
    required this.locale,
  });

  final String title;
  final String subtitle;
  final String locale;

  /// Метод для получения списка локалей
  static List<LocaleItemEntity> localeItems(BuildContext  context) =>
      [
        LocaleItemEntity(
          title: S.of(context).russianLanguage,
          subtitle: S.of(context).russia,
          locale: AppLocale.ruKey,
        ),
        LocaleItemEntity(
          title: S.of(context).english,
          subtitle: S.of(context).usa,
          locale: AppLocale.enKey,
        ),
        LocaleItemEntity(
          title: S.of(context).kazakhLanguage,
          subtitle: S.of(context).kazakhstan,
          locale: AppLocale.kzKey,
        ),
      ];
}
