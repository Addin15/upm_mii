import 'package:upm_mii/models/company.dart';

class InsurancePlan {
  final int? id;
  final String? name;
  final String? type;
  final String? description;
  final int? rate;
  final Company? company;

  InsurancePlan(
      {this.id,
      this.name,
      this.type,
      this.company,
      this.description,
      this.rate});

  factory InsurancePlan.fromJson(Map<String, dynamic> json) => InsurancePlan(
        id: json['i_id'],
        name: json['i_name'],
        type: json['i_type'],
        description: json['i_description'],
        rate: json['i_rate'],
        company: Company.fromJson(json),
        // company: Company(
        //   id: json['c_company'],
        //   name: json['c_name'],
        //   email: json['c_email'],
        //   address: json['c_address'],
        //   phone: json['c_phone'],
        //   about: json['c_about'],
        //   bgImgUrl: json['c_bg_img_url'],
        //   imgUrl: json['c_img_url'],
        // ),
      );
}
