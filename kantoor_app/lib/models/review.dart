class Review {
  int? id;
  int? rating;
  String? description;

  Review({this.id, this.rating, this.description});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson(Review reviews) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rating'] = rating;
    data['description'] = description;
    return data;
  }
}
