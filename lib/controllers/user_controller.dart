import 'dart:convert';

import 'package:http/http.dart';
import 'package:upm_mii/models/subscribed_plan.dart';
import 'package:upm_mii/models/user_information.dart';
import 'package:upm_mii/utils/config.dart';

class UserController {
  Future<List<SubscribedPlan>> getSubscribedPlans(int userId) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/$userId/subscribed/';
      List<SubscribedPlan> subscribedPlanList = [];
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
        List<SubscribedPlan> subscribedPlan =
            body.map((item) => SubscribedPlan.fromJson(item)).toList();
        subscribedPlanList = subscribedPlan;
      }

      return subscribedPlanList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> getUserInformation(int userId) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/$userId';
      late UserInformation userInformation;
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
        UserInformation userInfo =
            body[0].map((item) => UserInformation.fromJson(item)).toList();
        userInformation = userInfo;
      }

      return userInformation;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
