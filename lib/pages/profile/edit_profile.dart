import 'package:flutter/material.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/models/user_information.dart';
import 'package:upm_mii/pages/profile/informartion.dart';
import 'account.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, this.user, this.info}) : super(key: key);
  final User? user;
  final UserInformation? info;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with TickerProviderStateMixin {
  late TabController _tabController2;
  final PageStorageKey pageKey = const PageStorageKey('profile');

  @override
  void initState() {
    _tabController2 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 2 / 20 * height,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff243E82),
                      Color(0xff00AAE0),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                child: Container(
                  width: 9 / 10 * width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TabBar(
                    unselectedLabelColor: const Color(0xff243E82),
                    labelColor: Colors.white,
                    controller: _tabController2,
                    indicatorColor: Colors.blue,
                    indicator: ShapeDecoration(
                      color: const Color(0xff243E82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xff243E82),
                        ),
                      ),
                    ),
                    tabs: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Account',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Information',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              key: pageKey,
              controller: _tabController2,
              children: [
                Account(user: widget.user, info: widget.info),
                Information(user: widget.user, info: widget.info),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
