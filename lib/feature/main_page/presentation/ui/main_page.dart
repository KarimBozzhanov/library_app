import 'package:flutter/material.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/create_post/presentation/ui/create_post_screen.dart';
import 'package:library_app/feature/home/presentation/ui/home_page.dart';
import 'package:library_app/feature/profile/presentation/ui/profile_page.dart';
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
    SearchBuilder(),
    ProfileBuilder(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePostBuilder())),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          child: const Icon(
            Icons.add,
          ),
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
              label: S.of(context).home,
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
              label: S.of(context).search,
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
              label: S.of(context).account,
            ),
          ],
        ),
      ),
    );
  }
}
