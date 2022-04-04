class Company {
  final int? id;
  final String? name;
  final String? phone;
  final String? fax;
  final String? address;
  final String? about;

  Company({this.id, this.name, this.phone, this.fax, this.address, this.about});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        fax: json['fax'],
        address: json['address'],
        about: json['about'],
      );
}
