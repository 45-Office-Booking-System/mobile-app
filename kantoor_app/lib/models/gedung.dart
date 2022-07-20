import 'package:kantoor_app/models/jenis_gedung.dart';
import 'package:kantoor_app/models/nearby.dart';
import 'package:kantoor_app/models/review.dart';

class Gedungs {
  int? code;
  List<Data>? data;
  bool? status;

  Gedungs({this.code, this.data, this.status});

  Gedungs.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? location;
  String? price;
  String? latitude;
  String? longitude;
  String? description;
  List<Reviews>? reviews;
  List<Nearby>? nearby;
  List<JenisGedung>? jenisgedung;

  Data({
    this.id,
    this.name,
    this.location,
    this.price,
    this.latitude,
    this.longitude,
    this.description,
    this.reviews,
    this.nearby,
    this.jenisgedung,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    price = json['price'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['nearby'] != null) {
      nearby = <Nearby>[];
      json['nearby'].forEach((v) {
        nearby!.add(Nearby.fromJson(v));
      });
    }
    if (json['jenisgedung'] != null) {
      jenisgedung = <JenisGedung>[];
      json['jenisgedung'].forEach((v) {
        jenisgedung!.add(JenisGedung.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['price'] = price;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['description'] = description;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (nearby != null) {
      data['nearby'] = nearby!.map((v) => v.toJson()).toList();
    }
    if (jenisgedung != null) {
      data['jenisgedung'] = jenisgedung!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

List<List<String>> listImage = [
  [
    "https://images.weddingku.com/images/upload/products/images/370_md2YD3.jpg",
    "https://images.weddingku.com/images/upload/products/images/370_2KUOB5.jpg",
    "https://3.bp.blogspot.com/-PNHta0D2ji4/WtgA1XLTrNI/AAAAAAAAALk/GiYPiT3SJOAJpDjb9LUkxhfr0D2SHPuvQCLcBGAs/s1600/Ballroom.jpg",
  ],
  [
    "https://d2ile4x3f22snf.cloudfront.net/wp-content/uploads/sites/229/2017/12/04142822/FX8C0701-Edit-banner.jpg",
    "https://d2ile4x3f22snf.cloudfront.net/wp-content/uploads/sites/242/2018/01/31170622/orchardz-hotel-industri-gallery-image-18-1024x608.png",
    "https://alexandra.bridestory.com/image/upload/assets/whatsapp-image-2018-10-30-at-17.27.39-rkqvM2rnm.jpg",
  ],
  [
    "https://s3.ap-southeast-1.amazonaws.com/fab.thebridedept/2018/03/bandahara-ballroom-1-1448871607.jpg",
    "https://images.weddingku.com/images/upload/products/images/mercantilefasilitas_20.jpg",
    "https://london.bridestory.com/images/c_fill,dpr_1.0,f_auto,fl_progressive,pg_1,q_80,w_680/v1/assets/285929283691816f040457775cc16070690138e6/mac-wedding_mercantile-penthouse-wedding-0_9.jpg",
    "https://london.bridestory.com/images/c_fill,dpr_1.0,f_auto,fl_progressive,pg_1,q_80,w_680/v1/assets/03_VIP_ROOM_-_1225_wwn1mp/mac-wedding_mercantile-penthouse-wedding_43.jpg",
  ],
  [
    "https://www.mantenan.co.id/home/wp-content/uploads/2017/02/IMG-20161220-WA0006.jpg",
    "https://ozonehoteljakarta.com/gallery/5.jpg",
    "https://ozonehoteljakarta.com/gallery/8.jpg",
    "https://s3.ap-southeast-1.amazonaws.com/fab.thebridedept/2018/03/ppf_4452-1480566080.jpeg",
  ],
];
