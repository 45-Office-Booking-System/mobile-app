class Reviews {
  int? id;
  double? rating;
  String? description;

  Reviews({
    this.id,
    this.rating,
    this.description,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'].toDouble();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rating'] = rating;
    data['description'] = description;
    return data;
  }
}
