import 'package:ahad/pages/nav_pages/acceuil.dart';
import 'package:ahad/pages/nav_pages/admin.dart';
import 'package:ahad/pages/nav_pages/finances.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ahad/pages/nav_pages/compte.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [
    Acceuil(),
    Finances(),
    Admin(),
    MonCompte(),
  ];

  void onTap(int indexOfPage) {
    setState(() {
      currentIndex = indexOfPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            gap: 10,
            backgroundColor: Colors.indigo,
            tabBackgroundColor: Colors.grey.shade100,
            color: Colors.white,
            activeColor: Colors.indigo,
            padding: EdgeInsets.all(15),
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Acceuil',
              ),
              GButton(
                icon: Icons.money,
                text: 'Finances',
              ),
              GButton(
                icon: Icons.admin_panel_settings,
                text: 'Admin',
              ),
              GButton(
                icon: Icons.person,
                text: 'Compte',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
