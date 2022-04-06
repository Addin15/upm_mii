import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/controllers/company_controller.dart';
import 'package:upm_mii/models/company.dart';
import 'package:upm_mii/pages/plans/view_company.dart';

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
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
                    itemCount: companies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      ViewCompany(companies[index])));
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
                            //padding: const EdgeInsets.only(
                            //left: 15, right: 15, top: 10),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset('assets/company_default_logo.jpg'),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.primary,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    alignment: Alignment.center,
                                    child: Text(
                                      companies[index].name!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
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
