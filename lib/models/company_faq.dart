class CompanyFAQ {
  final int? id;
  final int? companyID;
  final String? topic;
  final String? content;

  CompanyFAQ({this.companyID, this.content, this.id, this.topic});

  factory CompanyFAQ.fromJson(Map<String, dynamic> json) => CompanyFAQ(
        id: json['id'],
        companyID: json['f_company'],
        topic: json['f_topic'],
        content: json['f_content'],
      );
}
