import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/dummy.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/models/insurance_plan.dart';
import 'package:upm_mii/pages/home/view_insurance_plan.dart';

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
  final FocusNode _searchFocus = FocusNode();
  List<InsurancePlan> insurances = [];

  @override
  void initState() {
    insurances = Dummy.insurancePlans;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
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
                    focusNode: _searchFocus,
                    onChanged: (search) {
                      if (search.isNotEmpty) {
                        List<InsurancePlan> searchedInsurances = [];
                        for (InsurancePlan insurance in insurances) {
                          if (insurance.name!
                              .toLowerCase()
                              .contains(search.toLowerCase())) {
                            searchedInsurances.add(insurance);
                          }
                        }
                        setState(() {
                          insurances = searchedInsurances;
                        });
                      } else {
                        setState(() {
                          insurances = Dummy.insurancePlans;
                        });
                      }
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.filter_outline),
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: insurances.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                ViewInsurancePlan(insurances[index])));
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  insurances[index].name!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                insurances[index].type!,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text('by ' + insurances[index].company!),
                          const SizedBox(height: 5),
                          const Text('3% premium rate'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
