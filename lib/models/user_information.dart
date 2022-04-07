class UserInformation {
  final int? id;
  final String? name;
  final String? address;
  final String? nric;
  final String? gender;
  final String? birth_date;
  final int? age;
  final String? phone;
  final String? state;

  UserInformation({
    this.id,
    this.name,
    this.address,
    this.nric,
    this.gender,
    this.birth_date,
    this.age,
    this.phone,
    this.state,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        id: json['user_id'],
        name: json['name'],
        address: json['address'],
        nric: json['nric'],
        gender: json['gender'],
        birth_date: json['birth_date'],
        age: int.parse(json['age']),
        phone: json['phone'],
        state: json['state'],
      );
}
