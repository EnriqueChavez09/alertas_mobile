import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    MapPage(),
    NewsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          _currentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.secondaryColor,
        selectedIconTheme: const IconThemeData(
          size: 22.0,
        ),
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        unselectedItemColor: AppTheme.primaryColor,
        backgroundColor: AppTheme.quaternaryColor,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: "Noticias",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Perfil",
          ),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
