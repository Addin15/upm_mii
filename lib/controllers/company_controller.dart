import 'dart:convert';

import 'package:http/http.dart';
import 'package:upm_mii/models/company.dart';
import 'package:upm_mii/models/insurance_plan.dart';
import 'package:upm_mii/utils/config.dart';

class CompanyController {
  Future<List<Company>> getCompanies() async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/companies/';
      List<Company> companies = [];
      var response = await get(
        Uri.parse(urlbase),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          //'Authorization': "Bearer " + token,
        },
      );

      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Company> company =
            body.map((item) => Company.fromJson(item)).toList();
        companies = company;

        print('success');
      }

      return companies;
    } catch (e) {
      print('error');
      print(e.toString());
      return [];
    }
  }

  Future<List<InsurancePlan>> getCompanyInsurances(String companyId) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase =
          '${Config.baseUrl}${Config.apiUrl}/company/$companyId/insurances';
      List<InsurancePlan> insurancePlanList = [];
      var response = await get(
        Uri.parse(urlbase),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          //'Authorization': "Bearer " + token,
        },
      );

      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<InsurancePlan> insurancePlan =
            body.map((item) => InsurancePlan.fromJson(item)).toList();
        insurancePlanList = insurancePlan;

        print('success');
      }

      return insurancePlanList;
    } catch (e) {
      print('error');
      print(e.toString());
      return [];
    }
  }
}
