import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/models/subscribed_plan.dart';

class ViewSubscribedPlan extends StatefulWidget {
  const ViewSubscribedPlan({this.type, this.plans, Key? key}) : super(key: key);

  final List<SubscribedPlan>? plans;
  final String? type;

  @override
  State<ViewSubscribedPlan> createState() => _ViewSubscribedPlanState();
}

class _ViewSubscribedPlanState extends State<ViewSubscribedPlan> {
  final TextEditingController _search = TextEditingController();

  List<SubscribedPlan> plans = [];

  @override
  void initState() {
    plans = widget.plans!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
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
                        // Color(0xff243E82),
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
                          widget.type!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: Style.formStyle(
                            icon: Icons.search_outlined,
                            hintText: 'Search plans',
                          ),
                          controller: _search,
                          onChanged: (val) {
                            List<SubscribedPlan> searchedPlan = [];

                            if (val.isNotEmpty) {
                              for (SubscribedPlan plan in widget.plans!) {
                                if (plan.insurancePlan!.name!
                                    .toLowerCase()
                                    .contains(val.toLowerCase())) {
                                  searchedPlan.add(plan);
                                }
                              }

                              setState(() {
                                plans = searchedPlan;
                              });
                            } else {
                              setState(() {
                                plans = widget.plans!;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        plans.isEmpty
                            ? Center(child: Text('No available plans'))
                            : Expanded(
                                child: ListView.separated(
                                    itemCount: plans.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      plans[index]
                                                          .insurancePlan!
                                                          .name!,
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    plans[index]
                                                        .insurancePlan!
                                                        .type!,
                                                    style: const TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'by ' +
                                                    plans[index]
                                                        .insurancePlan!
                                                        .company!
                                                        .name
                                                        .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'RM' +
                                                    plans[index]
                                                        .insurancePlan!
                                                        .rate!
                                                        .toStringAsFixed(2),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
