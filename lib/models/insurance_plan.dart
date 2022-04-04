class InsurancePlan {
  final int? id;
  final String? name;
  final String? type;
  final String? company;
  final String? description;

  InsurancePlan(
      {this.id, this.name, this.type, this.company, this.description});

  factory InsurancePlan.fromJson(Map<String, dynamic> json) => InsurancePlan(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        company: json['company'],
        description: json['description'],
      );
}
