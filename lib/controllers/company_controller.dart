import 'dart:convert';

import 'package:http/http.dart';
import 'package:upm_mii/models/company.dart';
import 'package:upm_mii/utils/config.dart';

class CompanyController {
  Future<List<Company>> getCompanies() async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/companies/';
      List<Company> insurancePlanList = [];
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
        List<Company> insurancePlan =
            body.map((item) => Company.fromJson(item)).toList();
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
