import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/models/company.dart';

class ViewCompany extends StatefulWidget {
  const ViewCompany(this.company, {Key? key}) : super(key: key);

  final Company? company;

  @override
  State<ViewCompany> createState() => _ViewCompanyState();
}

class _ViewCompanyState extends State<ViewCompany> {
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
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [],
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
