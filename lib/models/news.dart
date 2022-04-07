import 'package:intl/intl.dart';

class News {
  final String? image;
  final String? title;
  final DateTime? date;
  final String? url;

  News({this.date, this.image, this.title, this.url});

  factory News.fromJson(Map<String, dynamic> json) => News(
      image: json['s_img_url'],
      title: json['s_title'],
      date: DateTime.parse(json['s_date']),
      url: json['s_url']);
}
