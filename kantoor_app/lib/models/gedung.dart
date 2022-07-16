import 'package:kantoor_app/models/jenis_gedung.dart';
import 'package:kantoor_app/models/nearby.dart';
import 'package:kantoor_app/models/review.dart';

class Gedung {
  int id;
  String nama;
  String location;
  String price;
  int latitude;
  int longitude;
  String description;
  List<Review> reviews;
  List<Nearby> nearby;
  List<JenisGedung> jenisGedung;

  Gedung({
    required this.id,
    required this.nama,
    required this.location,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.reviews,
    required this.nearby,
    required this.jenisGedung,
  });
}
