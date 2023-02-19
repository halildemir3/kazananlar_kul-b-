class User {
  int? id;
  String? isim;
  String? soyisim;
  String? email;
  String? pass;
  String? vip;
  String? createdAt;
  String? updatedAt;
  int? admin;

  User(
      {this.id,
      this.isim,
      this.soyisim,
      this.email,
      this.pass,
      this.vip,
      this.createdAt,
      this.updatedAt,
      this.admin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    soyisim = json['soyisim'];
    email = json['email'];
    pass = json['pass'];
    vip = json['vip'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isim'] = this.isim;
    data['soyisim'] = this.soyisim;
    data['email'] = this.email;
    data['pass'] = this.pass;
    data['vip'] = this.vip;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['admin'] = this.admin;
    return data;
  }
}
