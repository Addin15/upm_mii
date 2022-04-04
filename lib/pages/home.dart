import 'package:flutter/material.dart';
import 'package:upm_mii/pages/home/company_list.dart';
import 'package:upm_mii/pages/home/insurance_plan_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}
