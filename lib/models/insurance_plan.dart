import 'package:upm_mii/models/company.dart';

class InsurancePlan {
  final int? id;
  final String? name;
  final String? type;
  final String? description;
  final int? rate;
  final Company? company;
  final String? incresingSum;
  final String? minSum;
  final String? entryAge;
  final String? maxCoverage;
  final String? noLapseBenefit;
  final String? coverTerm;
  final String? premiumType;
  final String? incomeTaxRelief;

  InsurancePlan({
    this.id,
    this.name,
    this.type,
    this.company,
    this.description,
    this.rate,
    this.coverTerm,
    this.entryAge,
    this.incomeTaxRelief,
    this.incresingSum,
    this.maxCoverage,
    this.minSum,
    this.noLapseBenefit,
    this.premiumType,
  });

  factory InsurancePlan.fromJsonWithCompany(Map<String, dynamic> json) =>
      InsurancePlan(
        id: json['i_id'],
        name: json['i_name'].toString(),
        type: json['i_type'].toString(),
        description: json['i_description'].toString(),
        rate: json['i_rate'],
        company: Company.fromJson(json),
        incresingSum: json['i_increasing_sum'].toString(),
        minSum: json['i_min_sum'].toString(),
        entryAge: json['i_entry_age'].toString(),
        maxCoverage: json['i_max_coverage'].toString(),
        noLapseBenefit: json['i_no_lapse_benefit'].toString(),
        coverTerm: json['i_cover_term'].toString(),
        premiumType: json['i_premium_type'].toString(),
        incomeTaxRelief: json['i_income_tax_relief'].toString(),
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
