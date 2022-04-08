import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/models/user_information.dart';
import 'package:upm_mii/pages/profile.dart';
import 'package:upm_mii/pages/plans.dart';
import 'package:upm_mii/pages/home.dart';
import 'package:upm_mii/pages/faqs.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedPage = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    User user = data['user'];
    UserInformation info = data['info'];
    print(info.name);

    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: const Color(0xff243E82),
      child: SafeArea(
        child: Scaffold(
          key: _key,
          // appBar: AppBar(
          //   title: const Text('Insurely'),
          //   elevation: 0.5,
          //   backgroundColor: Colors.white,
          //   toolbarHeight: 80,
          // ),
          body: IndexedStack(
            index: _selectedPage,
            children: [
              LoadHome(),
              FAQs(),
              Plans(user: user),
              Profile(user: user, info: info),
            ],
          ),
          endDrawer: Profile(user: user, info: info),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(0xff243E82),
            currentIndex: _selectedPage,
            onTap: (index) {
              if (index == 3) {
                _key.currentState!.openEndDrawer();
              } else {
                setState(() {
                  _selectedPage = index;
                });
              }
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
