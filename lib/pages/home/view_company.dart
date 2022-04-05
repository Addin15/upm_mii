import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/models/company.dart';
import 'package:upm_mii/models/insurance_plan.dart';
import 'package:upm_mii/pages/home/view_insurance_plan.dart';

class ViewCompany extends StatefulWidget {
  const ViewCompany(this.company, {Key? key}) : super(key: key);

  final Company? company;

  @override
  State<ViewCompany> createState() => _ViewCompanyState();
}

class _ViewCompanyState extends State<ViewCompany>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<InsurancePlan> insurances = [
    InsurancePlan(
      id: 0,
      name: 'Best',
      type: 'Life',
      company: 23,
      description: 'desc',
      rate: '1%',
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff243E82),
                      Color(0xff00AAE0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                height: 80,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Ionicons.chevron_back_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Company Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  // margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/background_dummy.jpg'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Company Names',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TabBar(
                            indicatorColor: AppColor.primary,
                            controller: tabController,
                            tabs: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text('Plans',
                                    style: TextStyle(
                                        fontSize: 14, color: AppColor.primary)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text('About',
                                    style: TextStyle(
                                        fontSize: 14, color: AppColor.primary)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text('FAQs',
                                    style: TextStyle(
                                        fontSize: 14, color: AppColor.primary)),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                insurancePlansTab(),
                                aboutTab(),
                                faqsTab(),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Positioned(
                        top: 50,
                        left: 10,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/company_default_logo.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Insurance plans tab
  Widget insurancePlansTab() {
    return insurances.isEmpty
        ? const Center(child: Text('No available insurance plans'))
        : Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff243E82),
                            Color(0xff00AAE0),
                            // Color(0xff243E82),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                insurances[index].type!,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'by ' + insurances[index].company!.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            insurances[index].rate!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }

  // Insurance plans tab
  Widget aboutTab() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 15),
            IntrinsicHeight(
              child: Row(
                children: [
                  Icon(Ionicons.call_outline),
                  SizedBox(width: 5),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: AppColor.primary,
                  ),
                  SizedBox(width: 15),
                  Text('03 17238832'),
                ],
              ),
            ),
            SizedBox(height: 15),
            IntrinsicHeight(
              child: Row(
                children: [
                  Icon(Ionicons.locate_outline),
                  SizedBox(width: 5),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: AppColor.primary,
                  ),
                  SizedBox(width: 15),
                  Text('Seri Kembangan, Selangor'),
                ],
              ),
            ),
            SizedBox(height: 15),
            IntrinsicHeight(
              child: Row(
                children: [
                  Icon(Ionicons.information_outline),
                  SizedBox(width: 5),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: AppColor.primary,
                  ),
                  SizedBox(width: 15),
                  Text('Best company'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Insurance plans tab
  Widget faqsTab() {
    return Expanded(child: Text('c'));
  }
}
