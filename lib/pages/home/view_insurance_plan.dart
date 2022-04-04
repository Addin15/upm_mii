import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_back_outline,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Insurely'),
        elevation: 0.5,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
      ),
    );
  }
}
