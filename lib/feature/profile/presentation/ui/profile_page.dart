import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/w_box.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';
import 'package:library_app/generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                S.current.account,
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Name:",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "John Doe",
                      style: TextStyle(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "E-mail:",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "johndoe123@mail.com",
                      style: TextStyle(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Password:",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "***************",
                      style: TextStyle(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Address:",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "No.23, James Street, New Town, North Province",
                      style: TextStyle(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              margin: const EdgeInsets.only(bottom: 32),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Group:",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "RPOD4-21R",
                      style: TextStyle(
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
                Expanded(
                  child: AppRoundedContainer(
                    backgroundColor: AppColors.rdBlack,
                    borderRadius: 8,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      S.current.edit,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const WBox(12),
                Expanded(
                  child: AppRoundedContainer(
                    onTap: () => context.read<GlobalAuthCubit>().logOut(),
                    borderColor: AppColors.rdBlack,
                    borderRadius: 8,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      S.current.logOut,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.rdBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
