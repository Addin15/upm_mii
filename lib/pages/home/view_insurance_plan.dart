import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/models/insurance_plan.dart';

class ViewInsurancePlan extends StatefulWidget {
  const ViewInsurancePlan(this.insurancePlan, {Key? key}) : super(key: key);

  final InsurancePlan insurancePlan;

  @override
  State<ViewInsurancePlan> createState() => _ViewInsurancePlanState();
}

class _ViewInsurancePlanState extends State<ViewInsurancePlan> {
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
                    const Expanded(
                      child: Text(
                        'Plan Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.primary),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                        'assets/company_default_logo.jpg'),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    widget.insurancePlan.company!.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Phone: 03 7127234',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const Text(
                                    'Email: company@company.com',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(widget.insurancePlan.name!),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Type',
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(widget.insurancePlan.type!),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Rate',
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(widget.insurancePlan.rate!),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(widget.insurancePlan.description!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: Style.buttonStyle(
                            color: AppColor.primary,
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
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
}
