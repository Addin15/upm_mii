import 'package:http/http.dart';
import 'package:upm_mii/models/subscribed_plan.dart';
import 'package:upm_mii/utils/config.dart';

class UserPlanController {
  Future<bool> applyInsurancePlan(int userId, int planId) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase =
          '${Config.baseUrl}${Config.apiUrl}/userplan/$userId/$planId/create';

      var response = await get(
        Uri.parse(urlbase),
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

  static Future<List<SubscribedPlan>> getUserPlan(int userId) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/userplan/$userId/get';

      var response = await get(
        Uri.parse(urlbase),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          //'Authorization': "Bearer " + token,
        },
      );

      if (response.statusCode == 201) {
        print('success');
        return [];
      }

      return [];
    } catch (e) {
      print('error');
      print(e.toString());
      return [];
    }
  }
}
