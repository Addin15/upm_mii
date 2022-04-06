import 'dart:convert';

import 'package:http/http.dart';
import 'package:upm_mii/models/insurance_plan.dart';
import 'package:upm_mii/utils/config.dart';

class InsurancePlanController {
  Future<List<InsurancePlan>> getInsurancePlans() async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/insurances/';
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
        List<InsurancePlan> insurancePlan = body
            .map((item) => InsurancePlan.fromJsonWithCompany(item))
            .toList();
        insurancePlanList = insurancePlan;
      }

      return insurancePlanList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
