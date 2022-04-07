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
      String urlbase =
          '${Config.baseUrl}${Config.apiUrl}/profile/$userId/profile';

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
        return userInfo;
      }

      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> createUserInformation(
      int userId, Map<String, dynamic> data) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase =
          '${Config.baseUrl}${Config.apiUrl}/profile/$userId/create';

      var response = await post(
        Uri.parse(urlbase),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          //'Authorization': "Bearer " + token,
        },
      );
      print(response.body);

      if (response.statusCode == 201) {
        print('true');
        return true;
      }

      return false;
    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }
  }
}
