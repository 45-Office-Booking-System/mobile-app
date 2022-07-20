class JenisGedung {
  int? id;
  String? jenis;

  JenisGedung({
    this.id,
    this.jenis,
  });

  JenisGedung.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenis = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['jenis'] = jenis;
    return data;
  }
}
