import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/style.dart';

class LoadCompanyList extends StatefulWidget {
  const LoadCompanyList({Key? key}) : super(key: key);

  @override
  State<LoadCompanyList> createState() => _LoadCompanyListState();
}

class _LoadCompanyListState extends State<LoadCompanyList> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
