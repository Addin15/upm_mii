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
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        address: json['address'],
        website: json['website'],
        imgUrl: json['img_url'],
        bgImgUrl: json['bg_img_url'],
        about: json['about'],
      );
}
