class Company {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;
  final String? about;
  final String? website;
  final String? imgUrl;
  final String? bgImgUrl;

  Company({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.about,
    this.bgImgUrl,
    this.imgUrl,
    this.website,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['c_id'],
        name: json['c_name'],
        phone: json['c_phone'],
        email: json['c_email'],
        address: json['c_address'],
        website: json['c_website'],
        imgUrl: json['c_img_url'],
        bgImgUrl: json['c_bg_img_url'],
        about: json['c_about'],
      );
}
