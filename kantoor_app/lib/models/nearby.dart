class Nearby {
  int? id;
  String? namefacilities;
  String? jenis;
  String? jarak;
  String? latitude;
  String? longitude;

  Nearby({this.id, this.namefacilities, this.jenis, this.jarak, this.latitude, this.longitude});

  Nearby.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namefacilities = json['namefacilities'];
    jenis = json['jenis'];
    jarak = json['jarak'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namefacilities'] = this.namefacilities;
    data['jenis'] = this.jenis;
    data['jarak'] = this.jarak;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
