import 'dart:convert';

import 'package:http/http.dart';
import 'package:upm_mii/models/news.dart';
import 'package:upm_mii/utils/config.dart';

class NewsController {
  static Future<List<News>> getNews() async {
    try {
      String urlbase = '${Config.baseUrl}${Config.apiUrl}/sks';
      List<News> newsList = [];
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
        print('Body' + body.toString());
        List<News> news = body.map((item) => News.fromJson(item)).toList();
        newsList = news;

        print('success');
      }
      return newsList;
    } catch (e) {
      print('error');
      print(e.toString());
      return [];
    }
  }
}
