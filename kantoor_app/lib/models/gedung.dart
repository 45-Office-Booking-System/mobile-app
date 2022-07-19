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
