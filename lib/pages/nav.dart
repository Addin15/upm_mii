import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/pages/account.dart';
import 'package:upm_mii/pages/discover.dart';
import 'package:upm_mii/pages/home.dart';
import 'package:upm_mii/pages/subscription.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

const pages = [
  Home(),
  Subscription(),
  Discover(),
  Account(),
];

class _NavState extends State<Nav> {
  final PageController _pageController = PageController();
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurely'),
        elevation: 0.5,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.heart_outline),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.school_outline),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: 'Account',
          )
        ],
      ),
    );
  }
}
