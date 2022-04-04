class UserInformation {
  final int? id;
  final String? name;
  final String? address;
  final String? nric;
  final double? income;

  UserInformation({
    this.id,
    this.name,
    this.address,
    this.nric,
    this.income,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        id: json['user_id'],
        name: json['name'],
        address: json['address'],
        nric: json['nric'],
        income: json['income'],
      );
}
