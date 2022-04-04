import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/pages/profile.dart';
import 'package:upm_mii/pages/plans.dart';
import 'package:upm_mii/pages/home.dart';
import 'package:upm_mii/pages/faqs.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

const pages = [
  Home(),
  FAQs(),
  Plans(),
  Profile(),
];

class _NavState extends State<Nav> {
  final PageController _pageController = PageController();
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: const Color(0xff243E82),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Insurely'),
          //   elevation: 0.5,
          //   backgroundColor: Colors.white,
          //   toolbarHeight: 80,
          // ),
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
            selectedItemColor: const Color(0xff243E82),
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
                icon: Icon(Ionicons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.school),
                label: 'FAQs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.clipboard),
                label: 'Plans',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.person),
                label: 'Account',
              )
            ],
          ),
        ),
      ),
    );
  }
}
