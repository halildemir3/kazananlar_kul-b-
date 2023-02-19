class MacModel {
  int? id;
  String? ev;
  String? dep;
  String? tarih;
  String? saat;
  String? stad;
  String? createdAt;
  String? updatedAt;
  String? image;
  List<Comments>? comments;

  MacModel(
      {this.id,
      this.ev,
      this.dep,
      this.tarih,
      this.saat,
      this.stad,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.comments});

  MacModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ev = json['ev'];
    dep = json['dep'];
    tarih = json['tarih'];
    saat = json['saat'];
    stad = json['stad'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ev'] = this.ev;
    data['dep'] = this.dep;
    data['tarih'] = this.tarih;
    data['saat'] = this.saat;
    data['stad'] = this.stad;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  int? macId;
  String? content;
  int? vip;
  String? createdAt;
  String? updatedAt;

  Comments(
      {this.id,
      this.macId,
      this.content,
      this.vip,
      this.createdAt,
      this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    macId = json['mac_id'];
    content = json['content'];
    vip = json['vip'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mac_id'] = this.macId;
    data['content'] = this.content;
    data['vip'] = this.vip;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
