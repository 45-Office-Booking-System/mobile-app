class PostReview {
  double? rating;
  String? description;
  int? idGedung;

  PostReview({this.rating, this.description, this.idGedung});

  PostReview.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    description = json['description'];
    idGedung = json['id_gedung'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['description'] = description;
    data['id_gedung'] = idGedung;
    return data;
  }
}
