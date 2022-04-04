import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/controllers/company_controller.dart';
import 'package:upm_mii/models/company.dart';

class LoadCompanyList extends StatefulWidget {
  const LoadCompanyList({Key? key}) : super(key: key);

  @override
  State<LoadCompanyList> createState() => _LoadCompanyListState();
}

class _LoadCompanyListState extends State<LoadCompanyList> {
  @override
  Widget build(BuildContext context) {
    CompanyController companyController = CompanyController();
    return FutureBuilder(
      future: companyController.getCompanies(),
      builder: (context, AsyncSnapshot<List<Company>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const SpinKitDancingSquare(
              color: Color(0xff243E82),
            ),
          );
        } else {
          print(snapshot.data);
          return CompanyList(
            companies: snapshot.data,
            controller: companyController,
          );
        }
      },
    );
  }
}

class CompanyList extends StatefulWidget {
  const CompanyList({this.companies, this.controller, Key? key})
      : super(key: key);

  final List<Company>? companies;
  final CompanyController? controller;

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList>
    with AutomaticKeepAliveClientMixin<CompanyList> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  final PageStorageKey _pageStorageKey = const PageStorageKey('company');

  late List<Company> companies = [];
  late CompanyController controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    companies = widget.companies!;
    controller = widget.controller!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _pageStorageKey,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 20, top: 8, bottom: 5, right: 20),
            child: TextFormField(
              decoration: Style.searchStyle(hintText: 'Search companies'),
              controller: _searchController,
              focusNode: _searchFocus,
              onChanged: (search) {
                if (search.isNotEmpty) {
                  List<Company> searchedCompanies = [];
                  for (Company company in widget.companies!) {
                    if (company.name!
                        .toLowerCase()
                        .contains(search.toLowerCase())) {
                      searchedCompanies.add(company);
                    }
                  }
                  setState(() {
                    companies = searchedCompanies;
                  });
                } else {
                  setState(() {
                    companies = widget.companies!;
                  });
                }
              },
            ),
          ),
          //const SizedBox(height: 10),
          companies.isEmpty
              ? const Center(child: Text('No available companies'))
              : Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
                    itemCount: companies.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: (context) =>
                          //             ViewInsurancePlan(companies[index])));
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
                                Text(
                                  companies[index].name!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const SizedBox(height: 5),
                                Text(
                                  companies[index].phone!,
                                  style: const TextStyle(color: Colors.white),
                                ),
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
