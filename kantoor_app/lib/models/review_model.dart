import 'package:uuid/uuid.dart';

class Review {
  late String id;
  String namaReviewer;
  String rating;
  String teks;
  String idGedung;

  Review({
    required this.namaReviewer,
    required this.rating,
    required this.teks,
    required this.idGedung,
  }) {
    id = const Uuid().v1();
  }
}
