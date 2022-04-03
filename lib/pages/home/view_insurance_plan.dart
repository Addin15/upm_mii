import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
