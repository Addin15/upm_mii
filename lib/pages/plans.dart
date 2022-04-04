import 'package:flutter/material.dart';
import 'package:upm_mii/pages/home/company_list.dart';
import 'package:upm_mii/pages/home/insurance_plan_list.dart';

class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> with TickerProviderStateMixin {
  late TabController _tabController;
  final PageStorageKey pageKey = const PageStorageKey('home');

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
                color: Colors.blue,
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: 9 / 10 * width,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.blue,
                    indicatorPadding: const EdgeInsets.only(top: 5),
                    tabs: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Insurance Plan',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Company',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
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
            key: pageKey,
            controller: _tabController,
            children: const [
              LoadInsurancePlanList(),
              LoadCompanyList(),
            ],
          ),
        ),
      ],
    );
  }
}
