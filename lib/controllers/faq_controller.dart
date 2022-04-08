import 'dart:convert';

import 'package:http/http.dart';
import 'package:upm_mii/models/company.dart';
import 'package:upm_mii/models/faq.dart';
import 'package:upm_mii/models/insurance_plan.dart';
import 'package:upm_mii/utils/config.dart';

class FAQController {
  Future<List<FAQ>> getFaqs() async {
    try {
      //String token = await AuthenticateUser.getCachedToken();
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/faqs';
      List<FAQ> faqs = [];
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
        List<FAQ> faq = body.map((item) => FAQ.fromJson(item)).toList();
        faqs = faq;

        print('success');
      }

      return faqs;
    } catch (e) {
      print('error');
      print(e.toString());
      return [];
    }
  }
}
