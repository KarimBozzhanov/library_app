import 'package:flutter/material.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/home/presentation/ui/home_page.dart';
import 'package:library_app/feature/profile/presentation/ui/profile_page.dart';
import 'package:library_app/feature/saved/presentation/ui/saved_page.dart';
import 'package:library_app/feature/search/presentation/ui/search_page.dart';
import 'package:library_app/generated/l10n.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final _screens = const [
    HomeBuilder(),
    SearchPage(),
    SavedPage(),
    ProfilePage(),
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTap,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.navBarColor,
          selectedItemColor: AppColors.rdBlack,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedLabelStyle: const TextStyle(
            color: AppColors.rdBlack,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          selectedLabelStyle: const TextStyle(
            color: AppColors.rdBlack,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  color: AppColors.rdBlack,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.home),
              ),
              backgroundColor: AppColors.rdBlack,
              label: S.current.home,
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.search),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  color: AppColors.rdBlack,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.search),
              ),
              backgroundColor: AppColors.rdBlack,
              label: S.current.search,
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.favorite_border),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  color: AppColors.rdBlack,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.favorite),
              ),
              label: S.current.saved,
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.person_outline),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                margin: const EdgeInsets.only(bottom: 4, top: 12),
                decoration: BoxDecoration(
                  color: AppColors.rdBlack,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.person),
              ),
              label: S.current.account,
            ),
          ],
        ),
      ),
    );
  }
}
