import 'dart:convert';

import 'package:http/http.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/utils/config.dart';

class AuthController {
  login(String email, String password) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/login';

      final Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };

      var response = await post(
        Uri.parse(urlbase),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          //'Authorization': "Bearer " + token,
        },
      );

      if (response.statusCode == 201) {
        Map body = jsonDecode(response.body);
        Map u = body['user'];

        User user = User(
          id: u['id'],
          username: u['name'],
          email: u['email'],
          token: body['token'],
        );
        print('success');
        print(user);
        return user;
      }
      return null;
    } catch (e) {
      print('error');
      print(e.toString());
      return null;
    }
  }

  register(String username, String email, String password) async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/register';

      final Map<String, dynamic> data = {
        'name': username,
        'email': email,
        'password': password,
      };

      Response response = await post(
        Uri.parse(urlbase),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          //'Authorization': "Bearer " + token,
        },
      );

      if (response.statusCode == 201) {
        Map body = jsonDecode(response.body);
        print(body);
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
