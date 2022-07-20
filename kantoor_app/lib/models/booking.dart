import 'package:kantoor_app/models/jenis_gedung.dart';

class Booking {
  int? code;
  List<Data>? data;
  bool? status;

  Booking({this.code, this.data, this.status});

  Booking.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? bookingcode;
  String? totalbooking;
  String? orderdate;
  String? checkin;
  String? checkout;
  String? fullname;
  String? phone;
  List<User>? user;
  List<Gedung>? gedung;
  List<JenisGedung>? jenis;

  Data(
      {this.id,
      this.status,
      this.bookingcode,
      this.totalbooking,
      this.orderdate,
      this.checkin,
      this.checkout,
      this.fullname,
      this.phone,
      this.user,
      this.gedung,
      this.jenis});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    bookingcode = json['bookingcode'];
    totalbooking = json['totalbooking'];
    orderdate = json['orderdate'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    fullname = json['fullname'];
    phone = json['phone'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    if (json['gedung'] != null) {
      gedung = <Gedung>[];
      json['gedung'].forEach((v) {
        gedung!.add(Gedung.fromJson(v));
      });
    }
    if (json['jenis'] != null) {
      jenis = <JenisGedung>[];
      json['jenis'].forEach((v) {
        jenis!.add(JenisGedung.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['bookingcode'] = bookingcode;
    data['totalbooking'] = totalbooking;
    data['orderdate'] = orderdate;
    data['checkin'] = checkin;
    data['checkout'] = checkout;
    data['fullname'] = fullname;
    data['phone'] = phone;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    if (gedung != null) {
      data['gedung'] = gedung!.map((v) => v.toJson()).toList();
    }
    if (jenis != null) {
      data['jenis'] = jenis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullname;
  String? alamat;
  String? phone;

  User({this.id, this.email, this.fullname, this.alamat, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    alamat = json['alamat'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullname'] = fullname;
    data['alamat'] = alamat;
    data['phone'] = phone;
    return data;
  }
}

class Gedung {
  int? id;
  String? name;
  String? price;
  String? location;
  String? latitude;
  String? longitude;
  String? description;

  Gedung({this.id, this.name, this.price, this.location, this.latitude, this.longitude, this.description});

  Gedung.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['description'] = description;
    return data;
  }
}
