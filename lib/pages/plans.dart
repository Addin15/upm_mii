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
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          indicatorPadding: const EdgeInsets.only(top: 5),
          tabs: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Insurance Plan',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Company',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
          ],
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
