import 'package:flutter/material.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/pages/plans/company_list.dart';
import 'package:upm_mii/pages/plans/insurance_plan_list.dart';

class Plans extends StatefulWidget {
  const Plans({this.user, Key? key}) : super(key: key);

  final User? user;

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: (2 / 10 * height) + 30,
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                height: 2 / 10 * height,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff243E82),
                    Color(0xff00AAE0),
                  ],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'InsureME',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              '"To save you in time of need"',
                              style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                      ],
                    ),
                    const Text(
                      'Insurance Plans',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: 9 / 10 * width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TabBar(
                    unselectedLabelColor: const Color(0xff243E82),
                    labelColor: Colors.white,
                    controller: _tabController,
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
                    // indicatorPadding: const EdgeInsets.only(top: 5),
                    tabs: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Insurance Plan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Company',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              LoadInsurancePlanList(user: widget.user),
              LoadCompanyList(user: widget.user),
            ],
          ),
        ),
      ],
    );
  }
}
