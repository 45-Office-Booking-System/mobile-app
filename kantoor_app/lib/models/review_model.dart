import 'package:kantoor_app/models/gedung_model.dart';
import 'package:uuid/uuid.dart';

class Review {
  late String id;
  // GedungModel namaGedung;
  String namaReviewer;
  double rating;
  String teks;
  // String idGedung;

  Review({
    // required this.namaGedung,
    required this.namaReviewer,
    required this.rating,
    required this.teks,
    // required this.idGedung,
  }) {
    id = const Uuid().v1();
  }
}
