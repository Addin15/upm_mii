import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/controllers/insurance_plan_controller.dart';
import 'package:upm_mii/models/insurance_plan.dart';
import 'package:upm_mii/pages/home/view_insurance_plan.dart';

class LoadInsurancePlanList extends StatefulWidget {
  const LoadInsurancePlanList({Key? key}) : super(key: key);

  @override
  State<LoadInsurancePlanList> createState() => _LoadInsurancePlanListState();
}

class _LoadInsurancePlanListState extends State<LoadInsurancePlanList> {
  @override
  Widget build(BuildContext context) {
    InsurancePlanController insurancePlanController = InsurancePlanController();
    return FutureBuilder(
      future: insurancePlanController.getInsurancePlans(),
      builder: (context, AsyncSnapshot<List<InsurancePlan>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const SpinKitDancingSquare(
              color: Colors.green,
            ),
          );
        } else {
          return InsurancePlanList(
            insurances: snapshot.data,
            controller: insurancePlanController,
          );
        }
      },
    );
  }
}

class InsurancePlanList extends StatefulWidget {
  const InsurancePlanList({this.insurances, this.controller, Key? key})
      : super(key: key);

  final List<InsurancePlan>? insurances;
  final InsurancePlanController? controller;

  @override
  State<InsurancePlanList> createState() => _InsurancePlanListState();
}

class _InsurancePlanListState extends State<InsurancePlanList> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  late List<InsurancePlan> insurances = [];
  late InsurancePlanController controller;

  @override
  void initState() {
    insurances = widget.insurances!;
    controller = widget.controller!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: insurances.isEmpty
          ? const Center(child: Text('No available insurance plans'))
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, top: 8, bottom: 5, right: 5),
                        child: TextFormField(
                          decoration: Style.searchStyle(
                              hintText: 'Search insurance plan'),
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
                                insurances = widget.insurances!;
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
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
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
