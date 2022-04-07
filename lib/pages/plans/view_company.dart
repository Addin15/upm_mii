import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/controllers/company_controller.dart';
import 'package:upm_mii/models/company.dart';
import 'package:upm_mii/models/company_faq.dart';
import 'package:upm_mii/models/insurance_plan.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/pages/plans/view_insurance_plan.dart';

class LoadViewCompany extends StatefulWidget {
  const LoadViewCompany({this.user, this.company, Key? key}) : super(key: key);

  final User? user;
  final Company? company;

  @override
  State<LoadViewCompany> createState() => _LoadViewCompanyState();
}

class _LoadViewCompanyState extends State<LoadViewCompany> {
  Future<Map<String, List<dynamic>>> getInsurancesandFaqs() async {
    CompanyController controller = CompanyController();
    List<InsurancePlan> insurances =
        await controller.getCompanyInsurances(widget.company!.id.toString());

    List<CompanyFAQ> faqs =
        await controller.getCompanyFaqs(widget.company!.id.toString());

    return {
      'insurances': insurances,
      'faqs': faqs,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInsurancesandFaqs(),
      builder: (context, AsyncSnapshot<Map<String, List<dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const SpinKitDancingSquare(
              color: Color(0xff243E82),
            ),
          );
        } else {
          return ViewCompany(
            user: widget.user,
            company: widget.company,
            insurances: snapshot.data!['insurances'] as List<InsurancePlan>,
            faqs: snapshot.data!['faqs'] as List<CompanyFAQ>,
          );
        }
      },
    );
  }
}

class ViewCompany extends StatefulWidget {
  const ViewCompany(
      {this.user, this.company, this.insurances, this.faqs, Key? key})
      : super(key: key);

  final User? user;
  final Company? company;
  final List<InsurancePlan>? insurances;
  final List<CompanyFAQ>? faqs;

  @override
  State<ViewCompany> createState() => _ViewCompanyState();
}

class _ViewCompanyState extends State<ViewCompany>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<InsurancePlan> insurances = [];
  List<CompanyFAQ> faqs = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    insurances = widget.insurances!;
    faqs = widget.faqs!;
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
                    Expanded(
                      child: Text(
                        widget.company!.name!,
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
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: getBgImg(widget.company!.bgImgUrl),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget.company!.name!,
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
                      Positioned(
                        top: 50,
                        left: 10,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: getImg(widget.company!.imgUrl),
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
        : ListView.separated(
            padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
            itemCount: insurances.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ViewInsurancePlan(
                              widget.user!, insurances[index])));
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
                          'by ' + insurances[index].company!.name.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          insurances[index].rate!.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }

  // Insurance plans tab
  Widget aboutTab() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView(
        children: [
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              children: [
                Icon(
                  Ionicons.call_outline,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 5),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 15),
                Text(widget.company!.phone!),
              ],
            ),
          ),
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              children: [
                Icon(
                  Ionicons.mail_outline,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 5),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 15),
                Text(widget.company!.email!),
              ],
            ),
          ),
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              children: [
                Icon(
                  Ionicons.globe_outline,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 5),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 15),
                Text(widget.company!.website!),
              ],
            ),
          ),
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              children: [
                Icon(
                  Ionicons.locate_outline,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 5),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 15),
                Text(widget.company!.address!),
              ],
            ),
          ),
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              children: [
                Icon(
                  Ionicons.information_outline,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 5),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 15),
                Text(widget.company!.about!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Insurance plans tab
  Widget faqsTab() {
    return faqs.isEmpty
        ? const Center(child: Text('No available FAQs'))
        : ListView.separated(
            padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
            itemCount: faqs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    header: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text(
                          faqs[index].topic!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 102, 102, 102)),
                        )),
                    collapsed: const SizedBox.shrink(),
                    expanded: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text(
                          faqs[index].content!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        )),
                  ),
                ),
              );
            },
          );
  }

  getBgImg(String? bgImgUrl) {
    if (bgImgUrl!.isEmpty) {
      return const AssetImage('assets/background_dummy.jpg');
    } else {
      return NetworkImage(bgImgUrl);
    }
  }

  getImg(String? imgUrl) {
    if (imgUrl!.isEmpty) {
      return const AssetImage('assets/company_default_logo.jpg');
    } else {
      return NetworkImage(imgUrl);
    }
  }
}
