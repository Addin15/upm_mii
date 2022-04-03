import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/dummy.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/models/insurance_plan.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

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
          indicatorColor: Colors.green,
          indicatorPadding: const EdgeInsets.only(top: 5),
          tabs: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Insurance Plan',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Company',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              InsurancePlanList(),
              CompanyList(),
            ],
          ),
        ),
      ],
    );
  }
}

class InsurancePlanList extends StatefulWidget {
  const InsurancePlanList({Key? key}) : super(key: key);

  @override
  State<InsurancePlanList> createState() => _InsurancePlanListState();
}

class _InsurancePlanListState extends State<InsurancePlanList> {
  final TextEditingController _searchController = TextEditingController();
  List<InsurancePlan> insurances = [];

  @override
  void initState() {
    insurances = Dummy.insurancePlans;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, top: 8, bottom: 5, right: 5),
                child: TextFormField(
                  decoration:
                      Style.searchStyle(hintText: 'Search insurance plan'),
                  controller: _searchController,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.filter_outline),
            )
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: insurances.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text(insurances[index].name!),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, top: 8, bottom: 5, right: 5),
                child: TextFormField(
                  decoration: Style.searchStyle(hintText: 'Search company'),
                  controller: _searchController,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.filter_outline),
            )
          ],
        )
      ],
    );
  }
}
